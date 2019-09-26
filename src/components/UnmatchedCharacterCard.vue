<template>
    <div class="outer" :class="[deckProperties.isPNP ? 'printnplay': '']" :style="userColours">
        <div class="main-wrapper">
            <div class="hero panel">
                <div class="name section">
                    <div class="gutter">
                        <h1>Hero</h1>
                    </div>
                    <div class="content xl">
                        {{deckProperties.heroName}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div>
                            <img v-if="deckProperties.heroIsRanged" class="ranged" src="~@/assets/images/ranged.png">
                            <img v-else="deckProperties.heroIsRanged" class="melee" src="~@/assets/images/melee.png">
                        </div>
                    </div>
                    <div class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="abilities panel">
                <div class="section">
                    <div class="gutter">
                        <h1>Special abilities</h1>
                    </div>
                    <div class="content mixed-case">
                        {{deckProperties.specialAbility}}
                    </div>
                </div>
            </div>

            <div class="sidekick panel">
                <div class="name section">
                    <div class="gutter">
                        <h1>Sidekick</h1>
                    </div>
                    <div class="content xl">
                        {{deckProperties.sidekickName}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div v-if="deckProperties.sidekickName">
                            <img v-if="deckProperties.sidekickIsRanged" class="ranged" src="~@/assets/images/ranged.png">
                            <img v-else="deckProperties.sidekickIsRanged" class="melee" src="~@/assets/images/melee.png">
                        </div>
                    </div>
                    <div class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
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
        deckProperties: {
            type: Object,
        },
    },
    data: function () {
        return {
            initialWidth: undefined,
        }
    },
    computed: {
        userColours: function() {
            return {
                'zoom': 1,
                // '-moz-transform-origin': 'left top',
                // '-moz-transform': 'scale(2)',
                '--inner-border-colour': this.deckProperties.isPNP ? this.deckProperties.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
            }
        },
    },
    mounted: function() {
        const heroNameText = this.$el.querySelector('.hero .name .xl.content');

        // TODO Probably can use something better than scrollWidth; look into that
        this.initialWidth = heroNameText.scrollWidth
    },
    watch: {
        'deckProperties.heroName': function(x) {
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
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@corner: 1.5mm;
@thick-border-width: 1mm;
@thin-border-width: 0.4mm;
@thinner-border-width: 0.2mm;

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

.printnplay {
    &.outer {
        border-radius: 0;
        background: var(--inner-border-colour);
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

.panel {
    height: 19.6mm;
    background: #FFF;

    &.abilities {
        height: 40.4mm + 2*@thick-border-width;
        background: #FFF;
        border-top: @thick-border-width solid var(--inner-border-colour);
        border-bottom: @thick-border-width solid var(--inner-border-colour);

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
        color: #999;

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

    img {
        &.ranged {
            width: 83%;
        }
        &.melee {
            width: 78%;
        }
        margin-left: 1mm;
    }
}

.health {
    height: 100%;
    margin-left: 38.2mm + @thin-border-width;

    .gutter {
        width: 6.3mm;
        h1 {
            left: 5.4mm;
            white-space: initial;
            line-height: 0.9em;
        }
    }

}
</style>
