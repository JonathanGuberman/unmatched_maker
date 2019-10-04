export default {
    data: function () {
        return {
            exampleDeckJSON
        }
    }
}

const exampleDeckJSON = JSON.stringify({
  "name": "",
  "appearance": {
    "isPNP": false,
    "borderColour": "#d0efc6",
    "highlightColour": "#ff3a93",
    "patternName": "Dominos"
  },
  "hero": {
    "name": "Hero",
    "isRanged": false,
    "hp": 15,
    "move": 2,
    "specialAbility": "This is a demo deck meant to show some of the capabilities of the generator and familiarise you with how it works.\nTry changing the Hero and Sidekick's names and properties!"
  },
  "sidekick": {
    "name": "sidekick",
    "isRanged": true,
    "hp": 6,
    "quantity": 1,
    "quote": "I work best alone"
  },
  "cards": [
    {
      "title": "Your first card",
      "type": "scheme",
      "characterName": "ANY",
      "value": 2,
      "boost": 4,
      "basicText": "Try changing the quantity of this card by hovering over the number in the lower right corner and clicking the + button.",
      "immediateText": "",
      "duringText": "",
      "afterText": "",
      "imageUrl": "",
      "quantity": 1
    },
    {
      "title": "Did it work?",
      "type": "defence",
      "characterName": "SUCCESS",
      "value": 2,
      "boost": 3,
      "basicText": "",
      "immediateText": "",
      "duringText": "",
      "afterText": "There should now be two copies of YOUR FIRST CARD. Try modifying either one: both copies will change!",
      "imageUrl": "",
      "quantity": 1
    },
    {
      "title": "Changing types",
      "type": "versatile",
      "characterName": "Any",
      "value": 3,
      "boost": 2,
      "basicText": "",
      "immediateText": "Clicking on the icon in the top left will change the card type.",
      "duringText": "",
      "afterText": "",
      "imageUrl": "",
      "quantity": 1
    },
    {
      "title": "The wrath of vul-kar",
      "type": "attack",
      "characterName": "VUL-KAR",
      "value": 4,
      "boost": 1,
      "basicText": "",
      "immediateText": "Here's an example of a card with an image.",
      "duringText": "",
      "afterText": "",
      "imageUrl": "https://restorationgames.com/wp-content/uploads/2018/09/FireballIsland-BoxTopcontents-1.jpg",
      "quantity": 1
    },
    {
      "title": "no boost",
      "type": "defence",
      "characterName": "ANY",
      "value": 2,
      "boost": 0,
      "basicText": "",
      "immediateText": "Notice that this card doesn't show a bosot value, because it's zero",
      "duringText": "Hover over the card to see and edit the bost value",
      "afterText": "",
      "imageUrl": "",
      "quantity": 1
    },
    {
      "title": "Auto-resizing text",
      "type": "scheme",
      "characterName": "SQUISHED NAME",
      "value": 2,
      "boost": 1,
      "basicText": "Try typing a long name in the upper left corner, or for the Hero and Sidekick names on the character card. The text and area should resize as needed.",
      "immediateText": "",
      "duringText": "",
      "afterText": "",
      "imageUrl": "",
      "quantity": 1
    },
    {
      "title": "Deleting a card",
      "type": "attack",
      "characterName": "Any",
      "value": 5,
      "boost": 2,
      "basicText": "",
      "immediateText": "This has 3 copies.",
      "duringText": "Delete using the X in the upper right.",
      "afterText": "All copies will be gone.",
      "imageUrl": "",
      "quantity": 3
    }
  ]
}, null, 2);