PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//370541/28562/2.18/7/4/Power Supply

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r80_40"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.4) (shapeHeight 0.8))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r250_175"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.75) (shapeHeight 2.5))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "SON95P300X300X100-7N" (originalName "SON95P300X300X100-7N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r80_40) (pt -1.5, 0.95) (rotation 90))
			(pad (padNum 2) (padStyleRef r80_40) (pt -1.5, 0) (rotation 90))
			(pad (padNum 3) (padStyleRef r80_40) (pt -1.5, -0.95) (rotation 90))
			(pad (padNum 4) (padStyleRef r80_40) (pt 1.5, -0.95) (rotation 90))
			(pad (padNum 5) (padStyleRef r80_40) (pt 1.5, 0) (rotation 90))
			(pad (padNum 6) (padStyleRef r80_40) (pt 1.5, 0.95) (rotation 90))
			(pad (padNum 7) (padStyleRef r250_175) (pt 0, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.125 1.8) (pt 2.125 1.8) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.125 1.8) (pt 2.125 -1.8) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 2.125 -1.8) (pt -2.125 -1.8) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -2.125 -1.8) (pt -2.125 1.8) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 1.5) (pt 1.5 1.5) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.5 1.5) (pt 1.5 -1.5) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.5 -1.5) (pt -1.5 -1.5) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 -1.5) (pt -1.5 1.5) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.5 0.75) (pt -0.75 1.5) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -1.9, 1.65) (radius 0) (width 0.25))
		)
	)
	(symbolDef "LD39050PU33R" (originalName "LD39050PU33R")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 175 mils 25 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))) (pinName (text (pt 225 mils 0 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 175 mils -75 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))) (pinName (text (pt 225 mils -100 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 175 mils -175 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))) (pinName (text (pt 225 mils -200 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 175 mils -275 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))) (pinName (text (pt 225 mils -300 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 1000 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 825 mils 25 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))) (pinName (text (pt 775 mils 0 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 6) (pt 1000 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 825 mils -75 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))) (pinName (text (pt 775 mils -100 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 7) (pt 1000 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinDes (text (pt 825 mils -175 mils) (rotation 0) (justify "Left") (textStyleRef "Normal"))) (pinName (text (pt 775 mils -200 mils) (rotation 0) (justify "Right") (textStyleRef "Normal"))
		))

		(line (pt 200 mils 100 mils) (pt 800 mils 100 mils) (width 8.0 mils))
		(line (pt 800 mils 100 mils) (pt 800 mils -400 mils) (width 8.0 mils))
		(line (pt 800 mils -400 mils) (pt 200 mils -400 mils) (width 8.0 mils))
		(line (pt 200 mils -400 mils) (pt 200 mils 100 mils) (width 8.0 mils))

		(attr "RefDes" "RefDes" (pt 500 mils 150 mils) (justify center) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 500 mils -450 mils)  (justify center) (isVisible True) (textStyleRef "Normal"))

	)

	(compDef "LD39050PU33R" (originalName "LD39050PU33R") (compHeader (numPins 7) (numParts 1) (refDesPrefix PS)
		)
		(compPin "1" (pinName "EN") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Input))
		(compPin "2" (pinName "GND") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "3" (pinName "PG") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Output))
		(compPin "4" (pinName "VOUT") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Output))
		(compPin "7" (pinName "PAD") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "6" (pinName "VIN") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "5" (pinName "NC") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "LD39050PU33R"))
		(attachedPattern (patternNum 1) (patternName "SON95P300X300X100-7N")
			(numPads 7)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
			)
		)
		(attr "Supplier_Name" "RS")
		(attr "RS Part Number" "")
		(attr "Manufacturer_Name" "STMicroelectronics")
		(attr "Manufacturer_Part_Number" "LD39050PU33R")
		(attr "Allied_Number" "")
		(attr "Other Part Number" "")
		(attr "Description" "STMICROELECTRONICS - LD39050PU33R - LDO, FIXED, 3.3V, 0.5A, DFN-6")
		(attr "Datasheet Link" "https://componentsearchengine.com/Datasheets/2/LD39050PU33R.pdf")
		(attr "Height" "1")
		(attr "<STEP Filename>" "LD39050PU33R.stp")
	)

)