<template>
    <div class="card" :class="[appearance.isPNP ? 'printnplay': '']" :style="userColours">
        <div class="main-wrapper">
            <div class="hero panel">
                <div class="name section">
                    <div class="gutter">
                        <h1>Hero</h1>
                    </div>
                    <div class="content xl">
                        {{hero.name}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div>
                            <img v-if="hero.isRanged" class="ranged icon" src="~@/assets/images/ranged.svg">
                            <img v-else class="melee icon" src="~@/assets/images/melee.svg">
                        </div>
                    </div>
                    <div class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
                        </div>
                        <div>
                            <svg width="12.1mm" height="6.7mm" viewBox="0 0 12.1 6.7">
                                <path
                                    class="home-plate"
                                    d="
                                        M 3.45 0.8
                                        a 11.5 11.5 0 0 1 5.2 0
                                        l 0 3.2
                                        l -2.6 2
                                        l -2.6 -2
                                        l 0 -3.2"
                                    stroke="none"
                                />
                                <path
                                    class="indicator"
                                    d="
                                        M 6.05 5.1
                                        l 0.7 -0.6
                                        l -1.4 0
                                        "
                                    stroke="none"

                                />
                                <path
                                    class="arc"
                                    d="
                                        M 0 2.2
                                        a 11.5 11.5 0 0 1 12.1 0"
                                    stroke-width="0.2"
                                    fill="none"
                                />
                            </svg>
                            <h2 class="hp">
                                {{hero.hp}}
                            </h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="abilities panel">
                <div class="special section">
                    <div class="gutter">
                        <h1>Special abilities</h1>
                    </div>
                    <div class="content mixed-case">
                        {{hero.specialAbility}}
                    </div>
                </div>
                <div class="move section">
                    <div class="arrow">
                        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 670 12990" preserveAspectRatio="none">
                            <g stroke="none">
                                <path d="M177 12699 c-80 -139 -144 -256 -141 -261 3 -4 61 -8 130 -8 l124 0 0 -5935 0 -5935 -124 0 c-69 0 -127 -4 -130 -8 -3 -5 60 -122 141 -261 120 -208 148 -250 159 -239 22 22 291 493 287 500 -2 5 -62 8 -134 8 l-129 0 0 5935 0 5935 129 0 c72 0 132 3 134 8 4 7 -265 478 -287 500 -11 11 -39 -30 -159 -239z"/>
                            </g>
                        </svg>
                    </div>
                    <div class="value">
                        {{hero.move}}
                    </div>
                    <div class="title">
                        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2790 12100" preserveAspectRatio="xMidYMid meet">
                            <g stroke="none">
                                <path d="M67 12003 c-4 -3 -7 -292 -7 -640 l0 -634 32 -14 c18 -7 299 -105 625 -217 325 -111 589 -206 585 -209 -4 -4 -279 -98 -612 -209 -333 -112 -611 -208 -618 -213 -9 -8 -12 -140 -10 -626 l3 -616 1325 0 1325 0 0 470 0 470 -698 5 -698 5 678 243 c373 134 688 250 701 258 22 14 22 15 22 293 0 211 -3 281 -12 288 -11 8 -294 108 -1208 427 l-185 65 691 0 c572 1 694 3 703 15 8 9 10 130 9 427 l-3 414 -1321 3 c-726 1 -1324 -1 -1327 -5z"/>
                                <path d="M955 8235 c-129 -24 -199 -46 -300 -95 -298 -144 -506 -412 -602 -775 l-36 -140 0 -305 0 -305 36 -140 c117 -441 403 -745 802 -852 99 -27 104 -27 486 -31 429 -4 493 2 663 59 200 67 388 206 513 379 107 148 163 271 215 474 29 114 31 134 36 361 5 271 -2 343 -53 530 -40 145 -83 241 -162 360 -179 270 -426 430 -743 481 -115 19 -753 18 -855 -1z m838 -975 c138 -20 226 -85 264 -193 25 -71 25 -223 0 -293 -37 -107 -127 -175 -254 -194 -87 -12 -747 -13 -833 0 -179 26 -274 144 -273 340 1 196 94 314 268 339 84 12 746 13 828 1z"/>
                                <path d="M67 5493 c-4 -3 -7 -230 -7 -503 0 -386 3 -500 13 -507 10 -8 1038 -343 1427 -466 l95 -30 -765 -256 -765 -256 -3 -434 c-1 -239 1 -438 6 -443 8 -8 2614 984 2640 1004 18 15 18 901 0 915 -14 11 -2612 983 -2626 983 -5 0 -12 -3 -15 -7z"/>
                                <path d="M71 2336 c-8 -10 -10 -314 -9 -1132 l3 -1119 345 0 345 0 3 653 2 652 190 0 190 0 2 -427 3 -428 215 0 215 0 3 428 2 427 190 0 190 0 0 -644 c0 -532 2 -646 14 -655 9 -8 117 -11 377 -9 l364 3 3 1119 c1 818 -1 1122 -9 1132 -17 21 -2621 21 -2638 0z"/>
                            </g>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="sidekick panel">
                <div v-if="sidekick.quantity" class="name section">
                    <div class="gutter">
                        <h1>Sidekick</h1>
                    </div>
                    <div class="content xl">
                        {{sidekick.name}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div v-if="sidekick.quantity" class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div v-if="sidekick.quantity">
                            <img v-if="sidekick.isRanged" class="ranged icon" src="~@/assets/images/ranged.svg">
                            <img v-else class="melee icon" src="~@/assets/images/melee.svg">
                        </div>
                    </div>
                    <div v-if="sidekick.quantity" class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
                        </div>
                        <div v-if="sidekick.quantity===1">
                            <svg width="12.1mm" height="6.7mm" viewBox="0 0 12.1 6.7">
                                <path
                                    class="home-plate"
                                    d="
                                        M 3.45 0.8
                                        a 11.5 11.5 0 0 1 5.2 0
                                        l 0 3.2
                                        l -2.6 2
                                        l -2.6 -2
                                        l 0 -3.2"
                                    stroke="none"
                                />
                                <path
                                    class="indicator"
                                    d="
                                        M 6.05 5.1
                                        l 0.7 -0.6
                                        l -1.4 0
                                        "
                                    stroke="none"

                                />
                                <path
                                    class="arc"
                                    d="
                                        M 0 2.2
                                        a 11.5 11.5 0 0 1 12.1 0"
                                    stroke-width="0.2"
                                    fill="none"
                                />
                            </svg>
                            <h2 class="hp">
                                {{sidekick.hp}}
                            </h2>
                        </div>
                        <div v-else class="quantity">
                            <div class="circle"
                                v-for="(item, index) in [...Array(sidekick.quantity)]"
                                :key="index"
                                :style="{'margin-left': circleOffset(index)}"
                            >
                                <span v-if="index === sidekick.quantity -1">
                                    X{{sidekick.quantity}}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from 'vue';

export default {
    name: 'UnmatchedCharacterCard',
    props: {
        hero: {
            type: Object,
            required: true
        },
        sidekick: {
            type: Object,
            required: true
        },
        appearance: {
            type: Object,
            required: true
        }
    },
    data: function () {
        return {
            initialWidth: undefined,
            meleeSvg: require('@/assets/images/ranged.svg'),
            rangedSvg: require('@/assets/images/melee.svg'),
        }
    },
    computed: {
        userColours: function() {
            return {
                'zoom': 1,
                // '-moz-transform-origin': 'left top',
                // '-moz-transform': 'scale(2)',
                '--inner-border-colour': this.appearance.isPNP ? this.appearance.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
                '--highlight-colour': this.appearance.highlightColour,
                '--contrast-colour': this.isDarkText(this.appearance.highlightColour),
            }
        },
    },
    mounted: function() {
        this.$nextTick(function () {
            const heroNameText = this.$el.querySelector('.hero .name .xl.content');
            const computedStyle = window.getComputedStyle(heroNameText);
            const paddingLeft = parseFloat(computedStyle.paddingLeft.replace('px',''));
            const paddingRight = parseFloat(computedStyle.paddingRight.replace('px',''));
            const width = parseFloat(computedStyle.width.replace('px',''));

            // TODO Probably can use something better than scrollWidth; look into that
            this.initialWidth = width - paddingLeft - paddingRight;
        });
    },
    watch: {
        'heroName': function() {
            Vue.nextTick(() => {
                const heroNameText = this.$el.querySelector('.hero .name .xl.content');
                const width = heroNameText.scrollWidth;

                heroNameText.style['transform'] = 'scaleX(1)';
                if (width > this.initialWidth) {
                    heroNameText.style['transform'] =`scaleX(${this.initialWidth/width})`;
                    heroNameText.style['transform-origin'] = 'left bottom';
                }
            });
        }
    },
    methods: {
        circleOffset: function(index) {
            const circleSize = 5.5;
            var offset;

            if (this.sidekick.quantity === 2){
                offset = index ? -circleSize/6 : -5*circleSize/6;
            } else {
                const farLeftOffset = -5.5;
                const farRightOffset = 5.5 - circleSize;
                const diff = farRightOffset - farLeftOffset;
                offset = farLeftOffset + index/(this.sidekick.quantity - 1) * diff;
            }

            return offset + "mm"
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@corner: 1.5mm;
@thick-border-width: 1mm;
@thin-border-width: 0.4mm;
@thinner-border-width: 0.2mm;

@media print {
  * {
    -webkit-transition: none !important;
    transition: none !important;
    zoom: 1 !important;
  }
}

.inner-border {
    background: var(--inner-border-colour);
    border-color: var(--inner-border-colour);
}

.card {
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

.printnplay {
    &.card {
        border-radius: 0;
        background: var(--inner-border-colour);
    }

    .panel, .panel.abilities {
        background: #FFF;

        color: #000;
    }

    .gutter {
        h1 {
            color: #999;
        }
    }

    .move {

        svg, .title svg {
            fill: #000;
        }
    }

    .health {
        .home-plate {
            fill: #C0C0C0;
        }

        .indicator {
            fill: #999;
        }

        .arc {
            stroke: #999;
        }

        .hp {
            color: #000;
        }
        .circle {
            border-color: #FFF;
            background: #C0C0C0;
            color: #000;
        }
    }
}

.panel {
    height: 19.6mm;
    background: #000;
    color: #FFF;

    &.abilities {
        height: 40.4mm + 2*@thick-border-width;
        border-top: @thick-border-width solid var(--inner-border-colour);
        border-bottom: @thick-border-width solid var(--inner-border-colour);

        background: var(--highlight-colour);
        color: var(--contrast-colour);

        .section {
            height: 100%;
            padding-top: 4.7mm;
        }

        .mixed-case {
            font-family: League Gothic, sans-serif;
        }

    }

    .xl {
        font-size: 9mm;
        white-space: nowrap;
    }

    .content {
        margin-left: 3.9mm; // gutter width
        padding-left: 1.7mm;
        padding-right: 1.7mm;
    }
}

.section {
    &.name {
        height: 11.5mm; // Has this included the border?
        border-bottom: @thin-border-width solid var(--inner-border-colour);

        padding-top: 1.7mm;

    }
    &.attack-health {
        height: 8.1mm;
        overflow: hidden;
        .section {
            padding-top: 1.3mm;
        }
    }
}

.gutter {
    float: left;
    height: 100%;
    width: 3.9mm; // includes border
    border-right: @thinner-border-width solid var(--inner-border-colour);
    position: relative;

    h1 {
        color: var(--inner-border-colour);

        bottom: 1mm;
        left : 3.4mm;
        white-space: nowrap;
        padding: 0;
        margin: 0;
        transform: rotate(-90deg);
        position: absolute;
        transform-origin: left bottom;
        text-align: left;
        text-transform: uppercase;
        font-size: 2.5mm;
    }
}

.attack {
    height: 100%;
    width: 38.2mm + @thin-border-width;
    float: left;
    border-right: @thin-border-width solid var(--inner-border-colour);

    .icon {
        &.ranged {
            width: 83%;
        }
        &.melee {
            width: 78%;
        }
        margin-left: 1mm;
        margin-top: -0.5mm;
    }
}

.special {
    height: 100%;
    width: 47.4mm;
    float:left;
}

.move {
    position: relative;
    margin-left: 47.4mm;
    padding-top: 0mm !important;

    .arrow {
        position: absolute;
        height: 100%;
        left: -0.95mm;

        svg {
            height: 100%;
            transform: scaleY(0.95);
            fill: var(--contrast-colour);

        }
    }

    .value {
        height: 20mm;
        text-align: center;
        font-size: 18mm;
        transform: scaleX(0.75) scaleY(1.25);
    }

    .title {
        height: 19.2mm;
        padding-left: 2.5mm;
        svg {
            height: 100%;
            fill: var(--contrast-colour);
;

        }
    }
}

.health {
    height: 100%;
    margin-left: 38.2mm + @thin-border-width;
    position: relative;
    .gutter {
        width: 6.3mm;
        h1 {
            left: 5.4mm;
            white-space: initial;
            line-height: 0.9em;
        }
    }

    svg {
        position: absolute;
        bottom: 0;

        .home-plate {
            fill: var(--highlight-colour);
        }

        .indicator {
            fill: #FFF8;
        }

        .arc {
            stroke: var(--outer-border-colour);
        }
    }

    .quantity {
        float: left;
        position: relative;
        width: 12.1mm;
    }

    .circle {
        position: absolute;
        width: 5.5mm;
        height: 5.5mm;
        left: 50%;
        margin-left: -3mm;
        border-radius: 100%;
        border: @thin-border-width solid #000;
        background: var(--highlight-colour);
        text-align: center;
        color: var(--contrast-colour);
        font-size: 3mm;
        padding-top: 0.75mm;
    }
}

.hp {
    position: relative;
    text-align: center;
    font-size: 3.8mm;
    margin-top: 0.8mm;
    margin-right: 0.2mm;
    color: var(--contrast-colour);
}
</style>
