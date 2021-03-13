# Fractal project - Recursive trees. Creator: Veselin Todorov 2021

#background creation
background <- function(xLimits, yLimits, color = "black")
{
  plot(1, type="n", bty="n", xlim = xLimits, ylim = yLimits) #set black background with no plot type and limits
}

#function to draw a line
drawLine <- function(lineCoordinates, color = "green", lineWidth = 1)
{
  segments(lineCoordinates[1], lineCoordinates[2], lineCoordinates[3], lineCoordinates[4], color, lineWidth) #draws line
}

#newline function
newLine <- function(line, angle, reduce=1) {
  
  x0 <- line[1]
  y0 <- line[2]
  x1 <- line[3]
  y1 <- line[4]
  
  dx <- unname(x1-x0)                      # how much x have changed
  dy <- unname(y1-y0)                      # how much y have changed
  l <- sqrt(dx^2 + dy^2)                   # length of the line
  
  angleBetween <- atan(dy/dx) * (180 / pi)          # angle between line and origin
  rad <- (angle + angleBetween) * (pi / 180)          # (angle + new angle) in radians
  
  coeff <- sign(angleBetween) * sign(dy)            # coefficient of direction
  if(coeff == 0) coeff <- -1
  
  x2 <- x0 + coeff*l*cos(rad)*reduce + dx  # new x location
  y2 <- y0 + coeff*l*sin(rad)*reduce + dy  # new y location
  return(c(x1,y1,x2,y2))
  
}

iterate <- function(object, ifun, ...) {
  linesList <- vector("list",0)
  for(i in 1:nrow(object)) {
    old_line <- matrix(object[i,], nrow=1)
    new_line <- ifun(old_line, ...)
    linesList[[length(linesList)+1]] <- new_line
  }
  new_object <- do.call(rbind, linesList)
  return(new_object)
}

#function that draws object
drawObject <- function(object, col="white", lwd=1) 
{
  invisible(apply(object, 1, drawLine, col=col, lineWidth=lwd))
}

# iterator function: recursive tree
tree <- function(line0, angle=30, reduce=.7, randomness=0) {
  
  # angles and randomness
  angle1 <- angle+rnorm(1,0,randomness)  # left branch
  angle2 <- -angle+rnorm(1,0,randomness) # right branch
  
  # new branches
  line1 <- newLine(line0, angle=angle1, reduce=reduce)   
  line2 <- newLine(line0, angle=angle2, reduce=reduce)
  
  # store in matrix and return
  mat <- matrix(c(line1,line2), byrow=T, ncol=4)
  return(mat)
  
}

# example: recursive tree (after ten iterations)
Z <- c(0,0) #point of center
A <- c(1e-9,5) #direction A
B <- c(5,-1e-9) #direction B
fractal <- matrix(c(Z,A,Z,B,Z,-A,Z,-B), nrow=4, byrow=T) #first fractal iteration
background(xLimits=c(-20,20), yLimits=c(-20,20)) #create background
drawObject(fractal) #draw E1
for(i in 1:11) {
  fractal <- iterate(fractal, ifun=tree, angle=29, reduce=.75) #change level of fractal
  drawObject(fractal, col=i+1) #draw E2 ... E12
}

