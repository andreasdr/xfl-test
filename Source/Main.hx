package;

import openfl.events.Event;
import openfl.data.DataProvider;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.display.XFLMovieClip;
import openfl.display.XFLTween;
import openfl.text.TextField;
import openfl.text.TextFormat;
import xfl.XFLAssets;

class Main extends Sprite {
	private function adjustDefaultTextFormat(textFormat:TextFormat):TextFormat {
		var textFormat:TextFormat = textFormat.clone();
		textFormat.color = 0xffffff;
		return textFormat;
	}

	public function new() {
		super();

		XFLAssets.getInstance().setup(["assets/assets",]);

		addChild(new Shape());

		var gui:XFLMovieClip = XFLAssets.getInstance().getXFLMovieClipAsset("TestWindow");
		addChild(gui);

		gui.getXFLCheckBox("checkBox1").textField.defaultTextFormat = adjustDefaultTextFormat(gui.getXFLCheckBox("checkBox1").textField.defaultTextFormat);
		gui.getXFLCheckBox("checkBox1").label = "Checkbox 1";
		gui.getXFLCheckBox("checkBox1").selected = true;
		gui.getXFLCheckBox("checkBox2").textField.defaultTextFormat = adjustDefaultTextFormat(gui.getXFLCheckBox("checkBox1").textField.defaultTextFormat);
		gui.getXFLCheckBox("checkBox2").label = "Checkbox 2";

		gui.getXFLRadioButton("radioButton1")
			.textField.defaultTextFormat = adjustDefaultTextFormat(gui.getXFLRadioButton("radioButton1").textField.defaultTextFormat);
		gui.getXFLRadioButton("radioButton1").groupName = "radioButtonGroup1";
		gui.getXFLRadioButton("radioButton1").label = "RadioBtn 1";
		gui.getXFLRadioButton("radioButton2")
			.textField.defaultTextFormat = adjustDefaultTextFormat(gui.getXFLRadioButton("radioButton2").textField.defaultTextFormat);
		gui.getXFLRadioButton("radioButton2").groupName = "radioButtonGroup1";
		gui.getXFLRadioButton("radioButton2").label = "RadioBtn 2";

		gui.getXFLProgressBar("progressBar").minimum = 0.0;
		gui.getXFLProgressBar("progressBar").maximum = 100.0;
		gui.getXFLProgressBar("progressBar").value = 50.0;

		gui.getXFLTextArea("textArea").text = "Hi, this is a text area, type something to see the scoll bar involved.";
		gui.getXFLTextArea("textArea").textField.defaultTextFormat = adjustDefaultTextFormat(gui.getXFLTextArea("textArea").textField.defaultTextFormat);

		var listDataProvider:DataProvider = new DataProvider();
		listDataProvider.addItem({label: "Item 1"});
		listDataProvider.addItem({label: "Item 2"});
		listDataProvider.addItem({label: "Item 3"});
		listDataProvider.addItem({label: "Item 4"});
		listDataProvider.addItem({label: "Item 5"});
		listDataProvider.addItem({label: "Item 6"});
		listDataProvider.addItem({label: "Item 7"});
		listDataProvider.addItem({label: "Item 8"});
		listDataProvider.addItem({label: "Item 9"});
		listDataProvider.addItem({label: "Item 10"});
		gui.getXFLList("list").dataProvider = listDataProvider;
		gui.getXFLList("list").selectedIndex = 2;

		var comboBoxDataProvider:DataProvider = new DataProvider();
		comboBoxDataProvider.addItem({label: "Item 1"});
		comboBoxDataProvider.addItem({label: "Item 2"});
		comboBoxDataProvider.addItem({label: "Item 3"});
		comboBoxDataProvider.addItem({label: "Item 4"});
		comboBoxDataProvider.addItem({label: "Item 5"});
		comboBoxDataProvider.addItem({label: "Item 6"});
		comboBoxDataProvider.addItem({label: "Item 7"});
		comboBoxDataProvider.addItem({label: "Item 8"});
		comboBoxDataProvider.addItem({label: "Item 9"});
		comboBoxDataProvider.addItem({label: "Item 10"});
		gui.getXFLComboBox("comboBox").dataProvider = comboBoxDataProvider;

		openfl.Lib.current.stage.addEventListener(Event.RESIZE, stageResizeHandler);

		gui.alpha = 0.0;
		XFLTween.to(gui, 1.0, {alpha: 1.0});
	}

	private function stageResizeHandler(event:Event):Void {
		cast(getChildAt(0), Shape).graphics.clear();
		cast(getChildAt(0), Shape).graphics.beginFill(0x000000);
		cast(getChildAt(0), Shape).graphics.drawRect(0.0, 0.0, openfl.Lib.current.stage.stageWidth, openfl.Lib.current.stage.stageHeight);
		getChildAt(1).x = (openfl.Lib.current.stage.stageWidth - getChildAt(1).width) / 2.0;
		getChildAt(1).y = (openfl.Lib.current.stage.stageHeight - getChildAt(1).height) / 2.0;
	}
}
