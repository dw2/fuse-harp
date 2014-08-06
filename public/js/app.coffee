jQuery(document).ready ($) ->

    $parallaxes = $('section[role=parallax]')

    if $parallaxes.length > 0

        doParallaxes = ->
            scrolled = $(window).scrollTop()
            $parallaxes.each ->
                $this = $(@)
                height = 480
                excess = 240
                offset = $this.offset().top
                passed = scrolled - offset
                if passed < 0
                    bgOffsetPerc = 100
                else if passed > height
                    bgOffsetPerc = 0
                else
                    bgOffsetPerc = 100 - (passed / height * 100)
                $this.css backgroundPosition: "50% #{bgOffsetPerc}%"

        $(window).resize doParallaxes
        $(window).scroll doParallaxes
