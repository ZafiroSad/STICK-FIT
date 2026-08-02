# Genera los iconos de STICK FIT dibujando la mancuerna del logo vectorialmente a cada tamano.
Add-Type -AssemblyName System.Drawing

$OUT = "C:\Users\kevin\Documents\KEVIN\02. WORK\03. PROYECTOS PERSONALES\STICK FIT"
$RED = [System.Drawing.Color]::FromArgb(159, 19, 19)   # #9F1313
$BG  = [System.Drawing.Color]::FromArgb(30, 31, 31)    # #1E1F1F

# Geometria medida del logo original (espacio 2000x2000, centro 999.5)
$TOTALW = 1150.0
$PLATEW = 79.5
$PLATES = @(  # dx (desde el centro), alto
  @(-535.5, 262), @(-415.0, 390), @(-293.5, 518),
  @( 293.5, 518), @( 415.0, 390), @( 535.5, 262)
)
$BARW = 424.0; $BARH = 76.0

function New-Icon($size, $coverage, $path) {
  $bmp = New-Object System.Drawing.Bitmap $size, $size
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.Clear($BG)

  $s = ($size * $coverage) / $TOTALW      # escala origen -> destino
  $cx = $size / 2.0; $cy = $size / 2.0
  $brush = New-Object System.Drawing.SolidBrush $RED

  # Barra central (extremos rectos)
  $g.FillRectangle($brush, [float]($cx - $BARW*$s/2), [float]($cy - $BARH*$s/2), [float]($BARW*$s), [float]($BARH*$s))

  # Discos (extremos redondeados: radio = mitad del ancho)
  $w = $PLATEW * $s
  foreach ($p in $PLATES) {
    $h = $p[1] * $s
    $x = $cx + $p[0]*$s - $w/2
    $y = $cy - $h/2
    $path2 = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path2.AddArc([float]$x, [float]$y, [float]$w, [float]$w, 180, 180)                 # cap superior
    $path2.AddArc([float]$x, [float]($y + $h - $w), [float]$w, [float]$w, 0, 180)       # cap inferior
    $path2.CloseFigure()
    $g.FillPath($brush, $path2)
    $path2.Dispose()
  }

  $brush.Dispose(); $g.Dispose()
  $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  "{0}  ->  {1}px (cobertura {2})" -f (Split-Path $path -Leaf), $size, $coverage
}

New-Icon 512 0.575 (Join-Path $OUT "icon-512.png")
New-Icon 192 0.575 (Join-Path $OUT "icon-192.png")
New-Icon 180 0.60  (Join-Path $OUT "apple-touch-icon.png")
New-Icon 64  0.86  (Join-Path $OUT "favicon.png")
