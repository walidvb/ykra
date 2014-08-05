$ ->
	window.imgs = []
	currentSlide = 0
	timer = null
	myImage = (item, index) ->
		$this = item
		self = {}
		self.elem = item
		self.big = $this.attr('data-big')
		self.small = $this.attr('data-small')
		self.load = () ->
			src = self.big
			img = new Image()
			img.src = src
			console.log 'Started fetching ' + src
			img.onload = () ->
				self.elem.css 'backgroundImage', "url('"+src+"')"
				self.is_loaded = true
				do self.loadNext
		self.show = (callback = null) ->
			timer = setTimeout () ->
				$('body').removeClass 'loading'
				do $this.show
			, 500
			do self.loadNext
			do callback unless callback is null
		self.hide = (callback = null) ->
			$('body').addClass 'loading'
			do $this.hide
			clearTimeout timer
			do callback unless callback is null
		self.init = () ->
			$this.click () ->
				do nextSlide
				$('body').removeClass 'info-open'
		self.index = index
		self.loadNext = () ->
			nextIndex = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
			nextSlide = imgs[nextIndex]
			do nextSlide.load unless nextSlide.is_loaded
		self

	nextSlide = () ->
		do imgs[currentSlide].hide
		currentSlide = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
		do imgs[currentSlide].show
	init = () ->
		all = shuffleArray($('.img-container'))
		addPosts all
		do imgs[0].load
		do imgs[0].show
	

	addPosts = (posts) ->
		offset = imgs.length-1
		posts.each (index) ->
			i = new myImage($(this), index+offset)
			i.init()
			imgs.push i
		imgs[offset+1].load()

	$('.info-trigger').bind 'hover click touch', () ->
		$('body').toggleClass 'info-open'

	do init
###
Randomize array element order in-place.
Using Fisher-Yates shuffle algorithm.
###
shuffleArray = (array) ->
  i = array.length - 1
  while i > 0
    j = Math.floor(Math.random() * (i + 1))
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i--
  array