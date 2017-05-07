import json

from flask import Flask, request
import requests

app = Flask(__name__)

# This needs to be filled with the Page Access Token that will be provided
# by the Facebook App that will be created.
PAT = 'EAAJiuqs8Pk4BAHrgj5S0l1TJC1scxEW5FLT4BSpj4eRJ5oICCXEcoBZAByozgugKXUos2iDuh97zy2GooUsv5MZANqTDul1c6W4sJ2pV6r8OIsSrS79XPDcc8yg1DcvE6QyhaOlymQWRk9l7HmiZCr0ZAryUa1pzcgFIaZBDynwZDZD'

@app.route('/', methods=['GET'])
def handle_verification():
    print "Handling Verification."
    if request.args.get('hub.verify_token') == 'my_voice_is_my_password_verify_me':
        print "Verification successful!"
        return request.args.get('hub.challenge')
    else:
        print "Verification failed!"
        return 'Error, wrong validation token'

@app.route('/', methods=['POST'])
def handle_messages():
    print "Handling Messages"
    print request.url
    payload = request.get_data()
    print payload
    for sender, message in messaging_events(payload):
        print "Incoming from %s: %s" % (sender, message)
        message = amend_message(message)
        print "We are going to send the reversed message: ", message
        send_message(PAT, sender, message)
    return "ok"

def amend_message(message):
    if message == "It is available":
        return "That is great. I am notifying Rahul"
    elif message == "Not available":
        return "Ok, No Problem."
    else:
        return "Thanks! We'll notify you when a new request arises."

def messaging_events(payload):
    """Generate tuples of (sender_id, message_text) from the
    provided payload.
    """
    data = json.loads(payload)
    messaging_events = data["entry"][0]["messaging"]
    for event in messaging_events:
        if "message" in event and "text" in event["message"]:
            yield event["sender"]["id"], event["message"]["text"].encode('unicode_escape')
        else:
            yield event["sender"]["id"], "I can't echo this"


def send_message(token, recipient, text):
    """Send the message text to recipient with id recipient.
    """

    message = \
    {
        "recipient": {
            "id": recipient
        },
        "message":{
            "text": text.decode('unicode_escape')
        }
    }
    r = requests.post("https://graph.facebook.com/v2.6/me/messages", params={"access_token": token},
                      data=json.dumps(message),
                      headers={'Content-type': 'application/json'})
    if r.status_code != requests.codes.ok:
        print r.text

if __name__ == '__main__':
    app.run()
