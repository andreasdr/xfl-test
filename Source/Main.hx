package;

import openfl.events.Event;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.display.XFLMovieClip;
import openfl.display.XFLTween;
import xfl.XFLAssets;

class Main extends Sprite {

    public function new() {
        super();

        XFLAssets.getInstance().setup(
			[
				"assets/assets",
			]
        );

        addChild(new Shape());

        var gui: XFLMovieClip = XFLAssets.getInstance().getXFLMovieClipAsset("TestWindow");
        addChild(gui);

        gui.getXFLCheckBox("checkBox1").label = "Checked!";
        gui.getXFLCheckBox("checkBox1").selected = true;

        gui.getXFLRadioButton("radioButton1").groupName = "radioButtonGroup1";
        gui.getXFLRadioButton("radioButton2").groupName = "radioButtonGroup1";

        gui.getXFLProgressBar("progressBar").minimum = 0.0;
        gui.getXFLProgressBar("progressBar").maximum = 100.0;
        gui.getXFLProgressBar("progressBar").value = 50.0;

        gui.getXFLTextArea("textArea").text = "Hi, this is a text area, type something to see the scoll bar involved.";

        openfl.Lib.current.stage.addEventListener(Event.RESIZE, stageResizeHandler);

        gui.alpha = 0.0;
        XFLTween.to(gui, 1.0, {alpha: 1.0});
    } 

	private function stageResizeHandler(event: Event): Void {
        cast(getChildAt(0), Shape).graphics.clear();
        cast(getChildAt(0), Shape).graphics.beginFill(0x000000);
        cast(getChildAt(0), Shape).graphics.drawRect(0.0, 0.0, openfl.Lib.current.stage.stageWidth, openfl.Lib.current.stage.stageHeight);
		getChildAt(1).x = (openfl.Lib.current.stage.stageWidth - getChildAt(1).width) / 2.0;
        getChildAt(1).y = (openfl.Lib.current.stage.stageHeight - getChildAt(1).height) / 2.0;
	}

}