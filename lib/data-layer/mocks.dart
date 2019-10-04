const JSONMocks = {
  "appId1": {
    "id": "appId1",
    "title": "App",
    "uiSchema": {
      "order": [
        "id1",
        "id5",
        "id4",
        "id2",
        "id3",
      ],
      "components": {
        "id1": {
          "id": "id1",
          "type": "heading",
          "value": {
            "text": "Heading of the app"
          }
        },
        "id2": {
          "id": "id2",
          "type": "button",
          "value": {
              "label": "Print message to a console"
          },
          "handlers": [
            "alert"
          ]
        },
        "id3": {
          "id": "id3",
          "type": "link",
          "value": {
            "text": "Read more about Wix.com",
            "src": "www.wix.com",
          }
        },
        "id4": {
          "id": "id4",
          "type": "text",
          "value": {
            "text": "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.",
          }
        },
        "id5": {
          "id": "id5",
          "type": "image",
          "value": {
            "src": "https://static.wixstatic.com/media/33c0e5f0-4a79-4fb3-96c1-d1b15f219957.png",
          }
        }
      }
    }
  }
};
