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
				self.loaded = true
			setTimeout () ->
				do self.loadNext
			, 2000
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
				$('body').removeClass 'info-open'
		self.index = index
		self.loadNext = () ->
			nextIndex = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
			nextSlide = imgs[nextIndex]
			do nextSlide.load unless nextSlide.loaded
			if self.index is imgs.length-1 then do getPosts
		self

	nextSlide = () ->
		do imgs[currentSlide].hide
		currentSlide = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
		do imgs[currentSlide].show
	init = () ->
		all = shuffleArray($('.img-container'))
		addPosts all
		window.onresize = () ->
			do imgs[currentSlide].load
		do imgs[0].load
		do imgs[0].show
	

	addPosts = (posts) ->
		offset = imgs.length-1
		posts.each (index) ->
			i = new myImage($(this), index+offset)
			i.init()
			imgs.push i
		imgs[offset+1].load()

	$('.info-trigger').click () ->
		$('body').toggleClass 'info-open'

	getPosts = (href) ->
		posts
		$.get href, (data) ->
			posts = $( '.img-container', $(data))
			insertPosts posts
			nextPage = $('.next-page', $(data))
			$('.next-page').replaceWith nextPage
		posts
	insertPosts = (posts) ->
		shuffleArray posts
		posts.each () ->
			$('.images').append $(this)
		addPosts(posts)

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