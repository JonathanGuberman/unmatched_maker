<template>
    <div class="zoom-box" :style="computedStyle">
        <div :style="{'transform': `scale(${zoomFactor})`, 'transform-origin': 'top left'}">
            <slot></slot>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ZoomBox',
    data: function() {
        return {
            initialWidth: undefined,
            initialHeight: undefined,
        }
    },
    props: {
        zoomFactor: {
            type: Number,
            default: 1
        }
    },
    computed: {
        zoomHeight: function() {
            return {'height': this.zoomFactor * this.initialHeight}
        },
        zoomWidth: function() {
            return {'width': this.zoomFactor * this.initialWidth}
        },
        computedStyle: function() {
            return {
                'width': this.zoomFactor * this.initialWidth + 'px',
                'height': this.zoomFactor * this.initialHeight + 'px'
            }
        },
    },
    mounted: function() {
        this.$nextTick(() => {
            this.initialHeight = this.$el.offsetHeight;
            this.initialWidth = this.$el.offsetWidth;
        });
    }
}
</script>

<style>
.zoom-box {
    height: 100%;
}
</style>
