curl -X POST -H "Content-Type: application/json" -d '{
  "recipient":{
    "id":"1686679184690772"
  },
  "message":{
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"generic",
        "elements":[
           {
            "title":"User Rahul has confirmed that he has the book foo by bar.",
            "image_url":"https://scontent.fdel1-1.fna.fbcdn.net/v/t1.0-9/12063825_841651689286422_7756024786108282479_n.jpg?oh=97f286380a62d66a95732e10f0347b14&oe=597BF263",
            "subtitle":"He is open for negotiaition, would you like to contact him?",
            "default_action": {
              "type": "web_url",
              "url": "https://peterssendreceiveapp.ngrok.io/view?item=103",
              "messenger_extensions": true,
              "webview_height_ratio": "tall",
              "fallback_url": "https://github.com"
            },
            "buttons":[
              {
                "type":"web_url",
                "url":"https://github.com",
                "title":"View Website"
              }              
            ]      
          }
        ]
      }
    },
    "quick_replies": [{
        "content_type": "text",
        "title": "Make offer to buy",
        "payload": "payload data"
    	},
    	{
		"content_type":"text", 
		"title": "Rent it",
		"payload": "Nothing for now",
    	},
    	{
    		"content_type": "text",
    		"title": "Decline",
    		"payload": "Nothing for now"
    	}
    ]
  }
}' "https://graph.facebook.com/v2.6/me/messages?access_token=EAAJiuqs8Pk4BAHrgj5S0l1TJC1scxEW5FLT4BSpj4eRJ5oICCXEcoBZAByozgugKXUos2iDuh97zy2GooUsv5MZANqTDul1c6W4sJ2pV6r8OIsSrS79XPDcc8yg1DcvE6QyhaOlymQWRk9l7HmiZCr0ZAryUa1pzcgFIaZBDynwZDZD"
