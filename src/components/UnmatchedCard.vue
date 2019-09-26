<template>
    <div class="outer" :class="[cardType, deckProperties.isPNP ? 'printnplay': '']" :style="userColours">
        <div class="main-wrapper">
            <div class="inner-top" :style="backgroundImage">
                <div class="upper-left-corner-wrapper">
                    <div class="upper-left-outer inner-border">
                        <div class="upper-left-icon">
                            <h2 v-if="cardType !== 'scheme'" class="value">
                                {{cardValue}}
                            </h2>
                        </div>
                        <div class="upper-left-icon-triangle">
                        </div>
                        <div class="upper-left-character">
                            <h2 class="character-name">
                                {{characterName}}
                            </h2>
                        </div>
                         <div class="upper-left-character-triangle">
                        </div>
                    </div>
                    <div class="upper-left-outer-triangle inner-border">
                    </div>
                </div>
            </div>
            <div class="inner-between inner-border">
                <div v-if="boostValue" class="boost-circle inner-border">
                    <div class="boost-value">
                        <h3>{{boostValue}}</h3>
                    </div>
                </div>
            </div>
            <div class="inner-bottom">
                <h3>{{cardTitle}}</h3>
                <hr />
                <div class="card-text">
                    <div v-if="cardType === 'scheme'">
                        {{basicText}}
                    </div>
                    <div v-if="immediateText && cardType !== 'scheme'">
                        <strong>Immediately:</strong>{{immediateText}}
                    </div>
                    <div v-if="duringText && cardType !== 'scheme'">
                        <strong>During combat:</strong>{{duringText}}
                    </div>
                    <div v-if="afterText && cardType !== 'scheme'">
                        <strong>After combat:</strong>{{afterText}}
                    </div>
                </div>
                <div class="bottom-right">
                    <span class="deck-name">{{deckProperties.name}}</span><span class="card-quantity">x{{cardQuantity}}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'UnmatchedCard',
    props: {
        deckProperties: {
            type: Object,
        },
        cardType: {
            default: "versatile"
        },
        cardValue: {
            type: Number,
            default: 2
        },
        characterName: {
            default: "Any"
        },
        boostValue: {
            type: Number,
            default: 1
        },
        cardTitle: {
            default: "Card title"
        },
        basicText: {
            default: ""
        },
        immediateText: {
            default: ""
        },
        duringText: {
            default: ""
        },
        afterText: {
            default: ""
        },
        cardQuantity: {
            type: Number,
            default: 1
        },
        imageUrl: {
            default: ''
        },
    },
    computed: {
        userColours: function () {
            return {
                'zoom': 1,
                // '-moz-transform-origin': 'left top',
                // '-moz-transform': 'scale(2)',
                '--inner-border-colour': this.deckProperties.isPNP ? this.deckProperties.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
            }
        },
        backgroundImage: function () {
            if (this.imageUrl) {
                return {
                    'background-image': `url(${this.imageUrl})`,
                    'background-repeat': 'no-repeat',
                    'background-size': '100%',
                }
            }
            return {}
        }
    },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@defence-blue: #2C76AC;
@attack-red: #DC3034;
@versatile-violet: #6C4E8D;
@scheme-yellow: #FCBD71;
@background-beige: #F7EADB;

@corner: 1.5mm;
@border-width: 0.8mm;
@upper-left-width: 10mm;
@upper-left-outer-width: @upper-left-width + @border-width;

@font-face {
    font-family: BebasNeueRegular;
    src: url("~@/assets/fonts/BebasNeueRegular-vm3oZ.otf");
}

@font-face {
    font-family: League Gothic;
    // src: url("~@/assets/fonts/accid___.ttf");
    src: url("~@/assets/fonts/LeagueGothic-Regular.otf");
}

* {
    font-family: BebasNeueRegular, sans-serif;
    color-adjust: exact;
}

@media print {
  * {
    -webkit-transition: none !important;
    transition: none !important;
    zoom: 1 !important;
  }
}

.versatile {
    .upper-left-icon{
        background: @versatile-violet;
        background-image: url("~@/assets/images/versatile.png");
        background-repeat: no-repeat;
        background-size: 6mm;
        background-position: 1.7mm 1.4mm;
    }
    .upper-left-icon-triangle{
        border-top-color: @versatile-violet;

    }
}

.attack {
    .upper-left-icon{
        background: @attack-red;
        background-image: url("~@/assets/images/attack.png");
        background-repeat: no-repeat;
        background-size: 6.6mm;
        background-position: 1.7mm 1.4mm;
    }
    .upper-left-icon-triangle{
        border-top-color: @attack-red;
    }
}
.scheme {
    .upper-left-icon{
        background: @scheme-yellow;
        background-image: url("~@/assets/images/scheme.png");
        background-repeat: no-repeat;
        background-size: 3.9mm;
        background-position: center;
    }
    .upper-left-icon-triangle{
        border-top-color: @scheme-yellow;
    }
}
.defence {
    .upper-left-icon{
        background: @defence-blue;
        background-image: url("~@/assets/images/defence.png");
        background-repeat: no-repeat;
        background-size: 5.3mm;
        // background-position: 2.5mm 1.4mm;
        background-position-x: center;
        background-position-y: 1.4mm;
    }
    .upper-left-icon-triangle{
        border-top-color: @defence-blue;
    }
}

.printnplay {
    &.outer {
        border-radius: 0;
        background: var(--inner-border-colour);
    }

    .upper-left-character {
        background: #FFF;
        .character-name {
            color: #000;
        }
    }

    .upper-left-character-triangle {
        border-top-color: #FFF;
    }

    // .inner-top {
    //     background: #FFF;
    // }

    .inner-between {
        .boost-circle {
            background: #FFF;
            .boost-value {
                color: #000;
            }
        }
    }

    .inner-bottom {
        background: #FFF;
        color: #000;

        .bottom-right {
            .card-quantity {
                border-left-color: #000;
            }
        }
    }
}

.inner-border {
    background: var(--inner-border-colour);
    border-color: var(--inner-border-colour);
}

.outer {
    width: 63mm;
    height: 88mm;
    background: var(--outer-border-colour);
    padding: 3mm;

    border-radius: 2.5mm;
}

.main-wrapper {
    overflow: hidden;
    border-radius: @corner;
}

.inner-top {
    // width: 57mm;
    // height: 82mm;
    height: 52.5mm;
    background: #FFF;
    // border-radius: @corner @corner 0 0;
    // padding: 5mm;
    // border: 1px solid black;
}

.inner-between {
    position: relative;
    height: @border-width;

    .boost-circle {
        position: absolute;
        z-index: 1;
        top: -3.6mm;
        left: 48mm;
        background: #000;
        border-width: @border-width;
        border-style: solid;

        width: 7.5mm;
        height: 7.5mm;
        border-radius: 100%;
        text-align: center;

        .boost-value {
            color: #FFF;
            h3 {
                margin: 0;
            }
            position: relative;
        }
    }
}

.inner-bottom {
    position: relative;
    height: 28.8mm;
    // border-radius: 0 0 @corner @corner;

    overflow: hidden;

    padding: 2mm 3mm 1mm;
    background: #000;
    color: #FFF;
    h3 {
        margin: 0;
    }

    hr {
        border-style: solid;
        margin: 0.5mm 0;
    }

    .card-text, .card-text div {
        font-size: 3.3mm;
        line-height: 1.2em;
        font-family: League Gothic, sans-serif;

        strong {
            font-size: 4mm;
            margin-right: 1mm;
        }
    }

    .bottom-right {
        padding: inherit;
        font-size: 1.8mm;
        position:absolute;
        bottom: 0;
        right:-1mm;

        .card-quantity {
            font-family: League Gothic, sans-serif;
            border-left: 0.2mm solid #FFF;
            padding-left: 0.5mm;
            padding-top: 0.7mm;
            margin-left: 0.5mm;
        }
    }
}

.upper-left-corner-wrapper {
    overflow: hidden;
}

.upper-left-outer {
    position: relative;
    top: 0;
    left: 0;
    height: 42.9mm + @border-width;
    width: @upper-left-width + @border-width;
    // border-top-left-radius: @corner;
}

.upper-left-outer-triangle {
    background: None;
    top: 0;
    margin-left: -@border-width;
    margin-top: -0.2mm;

    height: 0;
    width: 0;
    border-left: (@upper-left-outer-width + @border-width)/2 solid transparent;
    border-right: (@upper-left-outer-width + @border-width)/2 solid transparent;

    border-top: 3.4mm solid;
    border-top-color: var(--inner-border-colour);
}

.upper-left-icon {
    position: relative;
    z-index: 2;
    width: @upper-left-width;
    height: 14mm;
    // border-top-left-radius: @corner;
    text-align: center;
    overflow: visible;

    .value {
        margin: 0;
        padding-top: 7mm;
        color: #FFF;
        font-size:7.8mm;
    }
}

.upper-left-icon-triangle {
    // top: 0;
    // left: 0;
    // height: 0;
    // width: 0;
    position: absolute;
    top: 14mm;
    z-index: 1;
    margin-top: -0.2mm;
    margin-left: -0.2mm;
    border-left: @upper-left-width/2 + 0.15mm solid transparent;
    border-right: @upper-left-width/2 + 0.15mm solid transparent;

    border-top: 3.2mm solid;
}

.upper-left-character-triangle {
    position:relative;
    top: 0;
    left: 0;
    height: 0;
    width: 0;
    margin-top: -0.2mm;
    margin-left: -0.2mm;
    border-left: @upper-left-width/2 + 0.15mm solid transparent;
    border-right: @upper-left-width/2 + 0.15mm solid transparent;

    border-top: 3mm solid #000;


}

.upper-left-character {
    background: #000;
    height: 29mm;
    width: 10mm;
    position: relative;
    overflow: hidden;

    .character-name {
        white-space: nowrap;
        color: #FFF;
        padding: 0;
        margin: 0;
        transform: rotate(-90deg);
        position: absolute;
        transform-origin: right bottom;
        text-align: right;
        text-transform: uppercase;

        font-size:6mm;

        bottom: 24mm;
        right: 1.1mm;
    }
}
</style>
