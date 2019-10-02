<template>
    <div id="app" :style="userColours" :class="[deck.appearance.isPNP ? 'printnplay' : '']">
        <div class="no-print container">
            <div class="row py-3 justify-content-center">
                <div class="col-xl-10">
                    <h1>Unmatched Maker</h1>
                    <p>
                        <a href="https://restorationgames.com/unmatched/" target="_blank">Unmatched</a>
                         is a board game from <a href="https://restorationgames.com/" target="_blank">Restoration Games</a>
                        and <a href="https://mondotees.com/" target="_blank">Mondo Games</a> where players control various iconic
                        characters in combat against each other.
                        Each character has their own deck with a unique fighting style.
                    </p>
                    <p>
                        Of course, the more heroes there are to choose from,
                        the more fun the game becomes. So, in the hopes of facilitating
                        a community of fan expansions, this tool allows anybody to
                        create a deck in the style of the real game.
                    </p>
                    <div class="alert alert-primary">
                      <strong>This tool is not in any way affiliated with Restoration Games
                      or Mondo Games.</strong>
                      The look and design of the cards is a trademark of Restoration Games, LLC
                      and is used with permission. Decks using this design may not be used for commercial purposes.
                    </div>
                </div>
            </div>

            <div class="row py-3 justify-content-center">
                <div class="col-xl-10">
                    <h2>Editing</h2>
                    <p>
                        Move your mouse over the cards to see what you can edit.
                        Anything editable will be highlighted when you mouse over it.
                    </p>
                    <p>
                        Edit any text on a card by clicking on it and typing.
                        For numbers, click on the "increase" and "decease"
                        buttons that appear when you mouse over them.
                    </p>
                    <p>
                        You can create multiple copies of a card by changing the quantity
                        in the lower right corner. These cards remain linked;
                        modifications to any one will affect all of them!
                    </p>
                </div>
                <div class="col-xl-10">
                    <h2>Printing</h2>
                    <p>
                        What you see is not quite what you get: when you print,
                        everything except the cards will be hidden, and the cards
                        will be next to each other to make cutting them out easier.
                    </p>
                    <p>
                        To ensure correct printing, be sure to <strong>set your
                        paper orientation to "Landscape"</strong>. You can save to a file
                        using the "Save to PDF" option in your print dialogue.

                    </p>
                    <p>
                        <em>Firefox users note</em>: you will need to select "Print Background Colours"
                        and "Print Background Images" for everything to appear correctly.
                        This is in the "Print" dialogue on Macs and in the "Page Settings"
                        dialogue on Windows.
                    </p>
                </div>
                <div class="col-xl-10">
                    <h2>Saving and sharing</h2>
                    <p>
                        As you work your deck is automatically saved to your browser's local storage;
                        if you return in the same browser on the same computer, your deck should
                        still be there.
                    </p>
                    <p>
                        If you want to make more than one deck or share decks with friends,
                        scroll to the <a href="#deck-definition">Deck definition</a> section.
                        There you can copy and paste the code that defines your deck.
                        In the future I hope to have a more readable format for sharing, but
                        for now JSON will have to do.
                    </p>
                    <div class="row">
                        <div class="col-12">
                            <h4>Example</h4>
                        </div>
                        <div class="col-7">
                            <p>
                                Try copying this example deck and pasting it
                                in the <a href="#deck-definition">Deck definition</a> area.
                                As an added bonus, the cards will illustrate some of Unmatched
                                Maker's features.
                            </p>
                        </div>
                        <div class="col">
                            <textarea readonly onclick="this.focus();this.select()" style="width: 100%; height:100px; font-family: monospace;">{
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
    "specialAbility": "This is a demo deck meant to show some of the capabilities of the generator and familiarise you with how it works.\nTry changing the Hero and Sidekick's names and properties!\n"
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
      "basicText": "Try changing the quantity of this card by hovering over the number in the lower right corner and clicking the \"increase\" button.",
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
      "title": "Deleting a card\n",
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
}
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="col-xl-10">
                  <h2>Deck design principles</h2>
                  <p>Roman at <a href="http://www.geektopiagames.com/" target="_blank">Geektopia Games</a>
                    has written an article describing Unmatched
                    <a href="http://www.geektopiagames.com/games/unmatched/unmatched-deck-structure/" target="_blank">deck structure</a>.
                    He also has other <a href="http://www.geektopiagames.com/games/unmatched/" target="_blank">Unmatched articles</a>
                    that are extremely useful.
                  </p>
                  <p>
                    The place to discuss Unmatched fan decks seems to be the
                    BoardGameGeek Unmatched Vol. 1
                    <a href="https://boardgamegeek.com/forum/2870415/unmatched-battle-legends-volume-one/variants" target="_blank">
                      Variant forum
                    </a>. Go there to share your decks or bounce your ideas around.
                  </p>
                </div>
                <div class="col-xl-10">
                  <h2>Bugs and feature requests</h2>
                  <p>The project files for Unmatched Maker are available in the
                    <a href="https://github.com/JonathanGuberman/unmatched_maker/" target="_blank">GitHub repo</a>.
                    Please post any bugs or feature requests on the
                    <a href="https://github.com/JonathanGuberman/unmatched_maker/issues" target=_blank>Issues</a>
                    page there.
                  </p>
                </div>
            </div>
            <div class="row py-3">
                <div class="col-12">
                    <h2>Editor</h2>
                </div>
                <div class="col deck-properties">
                    <h3>Appearance</h3>
                    <div class="form-group">
                      <label for="zoomControl">Zoom</label>
                      <input type="range" class="form-control-range" id="zoomControl" min="1" max="2" step="any" v-model.number="zoom">
                      <small class="text-muted">Does not affect print size</small>
                    </div>
                    <div class="card-deck appearance">
                        <div class="card"
                            :class="[deck.appearance.isPNP ? 'text-muted' : 'border-primary']"
                            @click="deck.appearance.isPNP = false"
                        >
                            <h5 class="card-header">
                                Production
                            </h5>
                            <div class="card-body">
                                <p class="card-text">
                                    As close as possible to the real thing without having
                                    <a href="https://oliverbarrett.com/" target="_blank">Oliver Barrett</a> do the art for you.
                                </p>
                                <div class="form-group">
                                    <label>
                                        Highlight colour
                                    </label>
                                    <input
                                        v-model="deck.appearance.highlightColour"
                                        :disabled="deck.appearance.isPNP"
                                        class="form-control"
                                        type="color"
                                    >
                                </div>
                                <div class="form-group">
                                  <label>
                                    Background pattern
                                  </label>
                                  <SvgBackgroundPicker
                                    :selectedPattern="deck.appearance.patternName"
                                    :bgColour="deck.appearance.highlightColour"
                                    @change:background="pattern=$event.backgroundImage"
                                    @change:pattern="$set(deck.appearance, 'patternName', $event)"
                                  ></SvgBackgroundPicker>
                                  <small class="text-muted">
                                      Patterns by <a href="https://www.heropatterns.com/" target="_blank">Steve Schoger</a>
                                  </small>
                                </div>
                            </div>
                        </div>
                        <div class="card"
                            :class="[deck.appearance.isPNP ? 'border-primary': 'text-muted']"
                            @click="deck.appearance.isPNP = true"
                        >
                            <h5 class="card-header">
                                Print and play
                            </h5>
                            <div class="card-body">
                                <p class="card-text">
                                    Something a little simpler, but still great looking,
                                    for saving ink when printing DIY cards.
                                </p>
                                <p>
                                    <label>
                                        Border colour
                                    </label>
                                    <input
                                        v-model="deck.appearance.borderColour"
                                        :disabled="!deck.appearance.isPNP"
                                        class="form-control"
                                        type="color"
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-auto">
                    <h3>Character</h3>
                    <ZoomBox :zoomFactor="zoom">
                      <UnmatchedCharacterCard
                          :isEditable="true"
                          :heroName.sync="deck.hero.name"
                          :heroIsRanged.sync="deck.hero.isRanged"
                          :heroHp.sync="deck.hero.hp"
                          :heroMove.sync="deck.hero.move"
                          :heroSpecialAbility.sync="deck.hero.specialAbility"
                          :sidekickName.sync="deck.sidekick.name"
                          :sidekickIsRanged.sync="deck.sidekick.isRanged"
                          :sidekickHp.sync="deck.sidekick.hp"
                          :sidekickQuantity.sync="deck.sidekick.quantity"
                          :sidekickQuote.sync="deck.sidekick.quote"
                      />
                    </ZoomBox>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h3>Deck</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-auto py-3" v-for="(card, index) in fullDeck" :key="card.id">
                    <ZoomBox :zoomFactor="zoom">
                        <UnmatchedCard
                            :isEditable="true"
                            :deckProperties="deck"
                            :cardType.sync="card.data.type"
                            :cardValue.sync="card.data.value"
                            :cardTitle.sync="card.data.title"
                            :characterName.sync="card.data.characterName"
                            :boostValue.sync="card.data.boost"
                            :basicText.sync="card.data.basicText"
                            :immediateText.sync="card.data.immediateText"
                            :duringText.sync="card.data.duringText"
                            :afterText.sync="card.data.afterText"
                            :imageUrl.sync="card.data.imageUrl"
                            :cardQuantity.sync="card.data.quantity"
                            class="float-left shadow"
                            :class="{'border-danger': index >= 30}"
                            @delete:card="$delete(deck.cards, card.origIndex)"
                        />
                    </ZoomBox>
                </div>
                <div class="col-auto py-3" v-for="(_, index) in remainingCards" :key="index">
                    <ZoomBox :zoomFactor="zoom">
                      <div v-if="index === 0" class="unmatched-card blank" @click="add" style="cursor: pointer;">
                          <i class="fas fa-plus-circle"></i>
                      </div>
                      <div v-else class="unmatched-card blank">
                          {{index + fullDeck.length + 1}}
                      </div>
                    </ZoomBox>
                </div>
            </div>
            <div class="row py-5">
                <div class="col-12">
                    <h3 id="deck-definition">Deck definition</h3>
                    <div class="row">
                        <div class="col">
                            <p>
                                This is the code that defines your deck. You can copy and paste this
                                code to share or save your deck. You can also edit it live (which is
                                currently a bit buggy, so use at your own risk!)
                            </p>
                        </div>
                        <div class="col">
                            <textarea
                                :value="userDeck"
                                @input="parseDeck($event.target.value)"
                                style="width: 100%; height: 250px; font-family: monospace;"
                                onclick="this.focus();"
                                :class="{'border-danger user-input-invalid': !isValid}"
                            >
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row py-3 justify-content-center">
                <div class="col-10">
                    <h5>A Note on the Type</h5>
                    <p>
                        The real Unmatched cards are set in
                        <a href="https://www.typography.com/fonts/knockout/overview" target="_blank">Knockout</a> by Hoefler&Co.
                        Unmatched Maker uses free alternatives.
                    </p>
                    <p>
                        The headings are set in
                        <a href="https://www.fontsquirrel.com/fonts/bebas-neue" target="_blank">Bebas Neue Regular</a>
                        Unfortunately, the free version of Bebas Neue doesn't have lowercase glyphs, so places
                        that require them use
                        <a href="https://www.theleagueofmoveabletype.com/league-gothic" target="_blank">League Gothic Regular</a>
                        instead. Last but not least, the card descriptions are set in
                        <a href="https://www.fontsquirrel.com/fonts/archivo-narrow" target="_blank">Archivo Narrow Regular</a>
                        for legibility at small sizes.
                    </p>
                </div>
            </div>
        </div>

        <div class="print">
            <UnmatchedCharacterCard
                :heroName="deck.hero.name"
                :heroIsRanged="deck.hero.isRanged"
                :heroHp="deck.hero.hp"
                :heroMove="deck.hero.move"
                :heroSpecialAbility="deck.hero.specialAbility"
                :sidekickName="deck.sidekick.name"
                :sidekickIsRanged="deck.sidekick.isRanged"
                :sidekickHp="deck.sidekick.hp"
                :sidekickQuantity="deck.sidekick.quantity"
                :sidekickQuote="deck.sidekick.quote"
                :isEditable="false"
                class="float-left"
            />
            <UnmatchedCard v-for="card in fullDeck"
                :deckProperties="deck"
                :cardType="card.data.type"
                :cardValue="card.data.value"
                :cardTitle="card.data.title"
                :characterName="card.data.characterName"
                :boostValue="card.data.boost"
                :basicText="card.data.basicText"
                :immediateText="card.data.immediateText"
                :duringText="card.data.duringText"
                :afterText="card.data.afterText"
                :imageUrl="card.data.imageUrl"
                :cardQuantity="card.data.quantity"
                :key="card.id"
                :isEditable="false"
                class="float-left"
            />
        </div>
    </div>
</template>

<script>
import UnmatchedCard from '@/components/UnmatchedCard.vue'
import UnmatchedCharacterCard from '@/components/UnmatchedCharacterCard.vue'
import ZoomBox from '@/components/ZoomBox.vue'
import SvgBackgroundPicker from '@/components/SvgBackgroundPicker'

export default {
    name: 'app',
    components: {
        UnmatchedCard,
        UnmatchedCharacterCard,
        ZoomBox,
        SvgBackgroundPicker
    },
    data: function () {
        return {
            deck: {
                name: "",
                appearance: {
                    isPNP: false,
                    borderColour: "#E0EFF0",
                    highlightColour: "#F07838",
                    patternName: '',
                },
                hero: {
                    name: "Hero",
                    isRanged: false,
                    hp: 15,
                    move: 2,
                    specialAbility: "This is the character's special ability."
                },
                sidekick: {
                    name: "Sidekick",
                    isRanged: true,
                    hp: 6,
                    quantity: 1,
                    quote: "I work best alone"
                },
                cards: [],
            },
            userDeck: '',
            isValid: true,
            isPrint: false,
            zoom: 1,
            pattern: 'none',
        }
    },
    computed: {
        fullDeck: function() {
            var fullDeck = [];
            this.deck.cards.forEach((card, outerIndex) => {
                var quantity = parseInt(card.quantity) || 1;
                quantity = quantity > 0 ? quantity : 1;
                [...Array(quantity)].forEach((_, innerIndex) => {
                    fullDeck.push({
                        data: card,
                        id: `${outerIndex}_${innerIndex}`,
                        origIndex: outerIndex,
                    });
                });
            });
            return fullDeck
        },
        remainingCards: function() {
            const remainingCardCount = this.fullDeck.length < 30 ? 30 - this.fullDeck.length : 0;
            return [...Array(remainingCardCount)]
        },
        userColours: function() {
            return {
                '--inner-border-colour': this.deck.appearance.isPNP ? this.deck.appearance.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
                '--highlight-colour': this.deck.appearance.highlightColour,
                '--contrast-colour': this.isDarkText(this.deck.appearance.highlightColour),
                '--background-pattern': this.pattern,
            }
        }
    },
    watch: {
        'deck': {
            handler: function() {
                this.userDeck = JSON.stringify(this.deck, null, 2);
                this.localStorageSave();
            },
            deep: true
        }
    },
    mounted: function() {
        // window.onbeforeprint = (() => {
        //     this.isPrint = true;
        // });

        // window.onafterprint = (() => {
        //     this.isPrint = false;
        // });

        // window.matchMedia('print').addListener((mql) => {
        //   if(mql.matches) {
        //     this.isPrint = true;
        //   }
        // });

        // // window.matchMedia('screen').addListener((mql) => {
        // //   if(mql.matches) {
        // //     this.isPrint = false;
        // //   }
        // // });

        this.$nextTick(() => {
            if (localStorage.getItem('unmatched-deck')) {
                const deck = JSON.parse(localStorage.getItem('unmatched-deck'));
                this.deck.name = deck.name
                this.deck.appearance = deck.appearance
                this.deck.hero = deck.hero
                this.deck.sidekick = deck.sidekick
                deck.cards.forEach((card, index) => {
                    this.$set(this.deck.cards, index, card);
                })
            }
        });
    },
    methods: {
        add: function() {
            this.deck.cards.push(
                {
                    title: "Card title",
                    type: "versatile",
                    characterName: "Any",
                    value: 2,
                    boost: 1,
                    basicText: "",
                    immediateText: "",
                    duringText: "",
                    afterText: "",
                    imageUrl: '',
                    quantity: 1,
                })
        },
        parseDeck: function(value) {
            this.userDeck = value;
            try {
                this.deck = JSON.parse(value);
                this.isValid = true;
            } catch {
                this.isValid = false;
            }
        },
        localStorageSave: function() {
            localStorage.setItem('unmatched-deck', JSON.stringify(this.deck));
        },
        hexToRgb: function(hex) {
          // Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
          var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
          hex = hex.replace(shorthandRegex, function(m, r, g, b) {
            return r + r + g + g + b + b;
          });

          var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
          return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
          } : null;
        },
        isDarkText: function(hex) {
            const colour = this.hexToRgb(hex);
            const C = [colour.r/255, colour.g/255, colour.b/255].map(component => {
                if ( component <= 0.03928 ) {
                    return component/12.92
                } else {
                    return Math.pow((component+0.055)/1.055, 2.4);
                }
            });
            const L = 0.2126*C[0] + 0.7152*C[1] + 0.0722*C[2];
            return (L > 0.179) ? 'black' : 'white'
        }
    }
}
</script>

<style lang="less">
    @font-face {
        font-family: BebasNeueRegular;
        src: url("~@/assets/fonts/BebasNeueRegular-vm3oZ.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: League Gothic;
        src: url("~@/assets/fonts/LeagueGothic-Regular.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Regular.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Bold.otf");
        font-weight: bold;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Italic.otf");
        font-weight: normal;
        font-style: italic;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-BoldItalic.otf");
        font-weight: bold;
        font-style: italic;
    }

    * {
        box-sizing: border-box;
    }

    @page {
        size: landscape;
    }

    .printnplay {
        .unmatched-card {
            border-radius: 0;
            background: var(--inner-border-colour);
        }
    }

    .print {
        position: absolute;
        opacity: 0;
        top: 0;
        left: 0;
        z-index: -9999;
    }

    @media print {
        * {
            -webkit-transition: none !important;
            transition: none !important;
        }

        .no-print {
            display: none !important;
        }

        .print {
            opacity: 1;
            display: block !important;

            .unmatched-card {
                float: left;
                margin: 0;
                page-break-inside: avoid;
            }
        }
    }

    .unmatched-card {
        line-height: normal;
        // float: left;
        // margin: 50px;
    }

    .unmatched-card {
        width: 63mm;
        height: 88mm;
        background: var(--outer-border-colour);
        padding: 3mm;
        // border: 1px solid rgba(0,0,0,.125);

        border-radius: 2.5mm;
        &.blank {
            background: #EEE;
            color: #CCC;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            user-select: none;

            font-size: 32mm;
        }
    }

    .unmatched-card, .unmatched-card * {
        font-weight: normal;
        font-family: BebasNeueRegular, sans-serif;
        color-adjust: exact;
    }

    .appearance .card {
        cursor: pointer;
    }

    .user-input-invalid {
        border-width: 3px;
    }

    .border-danger {
        border-width: 1mm;
    }

    .deck-properties {
      min-width: 600px;
    }
</style>
