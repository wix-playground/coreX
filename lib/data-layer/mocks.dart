const JSONMocks = {
  "appId1": {
    "id": "appId1",
    "title": "App",
    "uiSchema": {
      "order": [
        "id1",
        "id2",
        "id3",
        "id4",
        "id5",
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
          "handlers": [
            "alert"
          ]
        },
        "id3": {
          "id": "id3",
          "type": "link",
          "value": {
            "src": "www.wix.com",
          }
        },
        "id4": {
          "id": "id4",
          "type": "text",
          "value": {
            "text": "Wix is Cool!",
          }
        },
        "id5": {
          "id": "id5",
          "type": "image",
          "value": {
            "src": "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png",
          }
        }
      }
    }
  }
};
