function love.load()
	WINDOW_HEIGHT = 800
	WINDOW_WIDTH =  600
	love.window.setMode( WINDOW_HEIGHT, WINDOW_WIDTH )
	x_rectangle = 375
	y_rectangle = 550
	vcy = 4
	vcx = 4
	x_circle = 45
	y_circle = 250
	cord = {{30,205},{30,165},{30,125},{30,85},{30,45},{30,5},{110,205},{110,165},{110,125},{110,85},
	{110,45},{110,5},{190,205},{190,165},{190,125},{190,85},{190,45},{190,5},{270,205},{270,165},{270,125},
	{270,85},{270,45},{270,5},{350,205},{350,165},{350,125},{350,85},{350,45},{350,5},{420,205},{420,165},
	{420,125},{420,85},{420,45},{420,5},{500,205},{500,165},{500,125},{500,85},{500,45},{500,5},{580,205},
	{580,165},{580,125},{580,85},{580,45},{580,5},{660,205},{660,165},{660,125},{660,85},{660,45},{660,5},
	{740,205},{740,165},{740,125},{740,85},{740,45},{740,5}}
	i = 0
end

function love.update(dt)

	if y_circle + 5 > y_rectangle + 20 then
		love.window.close( )
	end

	if (x_circle > x_rectangle) and (x_circle < x_rectangle + 50) and ((y_circle + 5 > y_rectangle + 20) or (y_circle + 5 > y_rectangle)) then -- Врезается в игрока и меняет скорость
		vcy = -vcy
	end

	if y_circle - 5 <= 0  then	-- Верхняя стенка
		if ((vcy < 0) and (vcx < 0)) or ((vcy < 0) and (vcx > 0)) then
		vcy = -vcy
		end
	end
	
	if x_circle + 5 >= 800 then -- Правая стенка
		vcx = -vcx
	end
	
	if x_circle -5 <= 0 then -- Левая стенка
		vcx = -vcx
	end
	
	
	y_circle = y_circle + vcy
	x_circle = x_circle + vcx

	if love.keyboard.isDown("lshift") then -- Ускорение
		vx = 6
	else
		vx = 3
	end

	if love.keyboard.isDown("left") then -- Движение влево
		if x_rectangle > 0 then
			x_rectangle = x_rectangle - vx
		end
	end
	
	if love.keyboard.isDown("right") then -- Движение вправо
		if x_rectangle < 750 then
			x_rectangle = x_rectangle + vx
		end
	end

	blocks()
	

	
end

function love.draw()
	love.graphics.setBackgroundColor( 0,0,6/10 )
	love.graphics.rectangle("fill", x_rectangle,y_rectangle,50,20)
	love.graphics.circle("fill", x_circle, y_circle, 10)
	for i = 1, #cord do
		love.graphics.rectangle("fill", cord[i][1],cord[i][2],50,20)
	end
	
	love.graphics.print(i , 10, 250, 0, 2, 2)
end

function blocks()
	for p = 1, #cord do
		if (y_circle - 5 < cord[p][2] + 20) and (y_circle - 5 > cord[p][2]) and (x_circle > cord[p][1]) and (x_circle < cord[p][1] + 50) then
			cord[p][1] = 1000
			vcy = -vcy
			i = i + 1
		end
	end
end
