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
		self.load = (size = 'big') ->
			console.log self.loaded
			src = if size == 'big' then self.big else self.small
			img = new Image()
			img.src = src
			console.log 'Started fetching ' + src
			img.onload = () ->
				#console.log 'Fetched '+src
				self.elem.css 'backgroundImage', "url('"+src+"')"
				self.loaded = true
			setTimeout () ->
				do self.loadNext
			, 2000
		self.loaded = false
		self.show = (callback = null) ->
			timer = setTimeout () ->
				do $this.show
			, 500
			do self.loadNext
			do callback unless callback is null
		self.hide = (callback = null) ->
			do $this.hide
			clearTimeout timer
			do callback unless callback is null
		self.init = () ->
			$this.click () ->
				do nextSlide
		self.index = index
		self.loadNext = () ->
			nextIndex = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
			nextSlide = imgs[nextIndex]
			do nextSlide.load unless nextSlide.loaded
		self

	nextSlide = () ->
		do imgs[currentSlide].hide
		currentSlide = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
		do imgs[currentSlide].show
	init = () ->
		all = shuffleArray($('.img-container'))
		lastSlide = all[all.length]
		all.each (index) ->
			i = new myImage($(this), index)
			#i.load('big')
			i.init()
			imgs.push i
		do imgs[0].load
		do imgs[0].show
	do init

	$('.info-trigger').click () ->
		$('.info').toggleClass 'open'

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