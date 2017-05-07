curl -X POST -H "Content-Type: application/json" -d '{
  "recipient":{
    "id":"1639866282705033"
  },
  "message":{
    "attachment":{
      "type":"template",
      "payload":{
        "template_type":"generic",
        "elements":[
           {
            "title":"User Avirup has asked you for the book foo by bar",
            "image_url":"https://scontent.fdel1-1.fna.fbcdn.net/v/t1.0-9/14264851_1194930920580070_7498914739348661215_n.jpg?oh=51c1bf240d163dd60b9a61b5f3af9de9&oe=598298AF",
            "subtitle":"Will you like to negotiate?",
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
        "title": "It is available",
        "payload": "payload data"
    	},
    	{
		"content_type":"text", 
		"title": "Not available",
		"payload": "Nothing for now",
    	},
    	{
    		"content_type": "text",
    		"title": "Available Later",
    		"payload": "Nothing for now"
    	}
    ]
  }
}' "https://graph.facebook.com/v2.6/me/messages?access_token=EAAJiuqs8Pk4BAHrgj5S0l1TJC1scxEW5FLT4BSpj4eRJ5oICCXEcoBZAByozgugKXUos2iDuh97zy2GooUsv5MZANqTDul1c6W4sJ2pV6r8OIsSrS79XPDcc8yg1DcvE6QyhaOlymQWRk9l7HmiZCr0ZAryUa1pzcgFIaZBDynwZDZD"