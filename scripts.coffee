$ ->
	imgs = []
	currentSlide = 0
	Image = (item) ->
		$this = item
		self = {}
		self.elem = item
		self.big = $this.attr('data-big')
		self.small = $this.attr('data-small')
		self.load = (size = 'big') ->
			src = if size == 'big' then self.big else self.small
			self.elem.css 'backgroundImage', "url('"+src+"')"
		self.show = (callback) ->
			$this.show callback 
		self.hide = (callback) ->
			$this.hide callback
		self.init = () ->
			$this.click () ->
				do nextSlide
		self

	nextSlide = () ->
		do imgs[currentSlide].hide
		currentSlide = if currentSlide+1 >= imgs.length then 0 else currentSlide+1
		do imgs[currentSlide].show
	init = () ->
		all = $ '.img-container'
		all.each () ->
			i = new Image($(this))
			i.load('big')
			i.init()
			imgs.push i
		shuffleArray(imgs)
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