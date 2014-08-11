jQuery(document).ready ($) ->
    $body = $('body')
    $.touchEnabled = typeof(ontouchstart) isnt 'undefined';

    # Dropdown header menu
    $menu = $('body > header nav')
    $menu.on 'click', (e) ->
        $body.toggleClass 'menuOpen'
        unless $(e.target).prop('tagName').toLowerCase() is 'a'
            e.preventDefault()
            return false
    $('html').click -> $body.removeClass 'menuOpen'


    # Parallax sections
    $parallaxes = $('section[role=parallax]')
    if $parallaxes.length > 0
        if $.touchEnabled
            $parallaxes.css backgroundPosition: '50% 50%'
        else
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
