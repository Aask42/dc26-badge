PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//414722/28562/2.25/3/0/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r132.08_55.88"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.5588) (shapeHeight 1.3208))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(padStyleDef "r132.08_50.8"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 0.508) (shapeHeight 1.3208))
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
	(patternDef "SOT95P237X112-3N" (originalName "SOT95P237X112-3N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r132.08_55.88) (pt -1.0922, 0.9398) (rotation 90))
			(pad (padNum 2) (padStyleRef r132.08_55.88) (pt -1.0922, -0.9398) (rotation 90))
			(pad (padNum 3) (padStyleRef r132.08_50.8) (pt 1.0922, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -3.4544, 2.54) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0.7112 0.5842) (pt 0.7112 1.524) (width 0.1524))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.2794 -1.524) (pt 0.7112 -1.524) (width 0.1524))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0.7112 -1.524) (pt 0.7112 -0.5842) (width 0.1524))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0.7112 1.524) (pt 0.3048 1.524) (width 0.1524))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0.3048 1.524) (pt -0.2794 1.524) (width 0.1524))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.7112 0.3302) (pt -0.7112 -0.3302) (width 0.1524))
		)
	)
	(symbolDef "LM4040D50IDBZR" (originalName "LM4040D50IDBZR")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 1200 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 970 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1000 mils 100 mils) (width 6 mils))
		(line (pt 1000 mils 100 mils) (pt 1000 mils -200 mils) (width 6 mils))
		(line (pt 1000 mils -200 mils) (pt 200 mils -200 mils) (width 6 mils))
		(line (pt 200 mils -200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1050 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1050 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "LM4040D50IDBZR" (originalName "LM4040D50IDBZR") (compHeader (numPins 3) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "CATHODE") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "ANODE") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "NC") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "LM4040D50IDBZR"))
		(attachedPattern (patternNum 1) (patternName "SOT95P237X112-3N")
			(numPads 3)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
			)
		)
		(attr "Manufacturer_Name" "Texas Instruments")
		(attr "Manufacturer_Part_Number" "LM4040D50IDBZR")
		(attr "RS Part Number" "6619385")
		(attr "RS Price/Stock" "http://uk.rs-online.com/web/p/products/6619385")
		(attr "Arrow Part Number" "LM4040D50IDBZR")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/lm4040d50idbzr/texas-instruments")
		(attr "Description" "Texas Instruments LM4040D50IDBZR, Shunt Voltage Reference 5V, 1%, 3-Pin SOT-23")
		(attr "<Hyperlink>" "http://www.ti.com/lit/gpn/lm4040")
	)

)
