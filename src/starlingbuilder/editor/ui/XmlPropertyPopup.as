/**
 *  Starling Builder
 *  Copyright 2015 SGN Inc. All Rights Reserved.
 *
 *  This program is free software. You can redistribute and/or modify it in
 *  accordance with the terms of the accompanying license agreement.
 */
package starlingbuilder.editor.ui
{
    import starlingbuilder.editor.UIEditorApp;
    import starlingbuilder.editor.controller.ComponentRenderSupport;

    public class XmlPropertyPopup extends ObjectPropertyPopup
    {
        public function XmlPropertyPopup(owner:Object, target:Object, targetParam:Object, onComplete:Function)
        {
            super(owner, target, targetParam, onComplete);
        }

        override protected function setCustomParam(name:String):void
        {
            var param:Object = ComponentRenderSupport.support.extraParamsDict[_owner];

            if (param.params == undefined)
            {
                param.params = {};
            }

            param.params[_targetParam.name] =
            {
                cls:"XML",
                name: name
            };
        }

        override protected function getDataNames():Vector.<String>
        {
            return UIEditorApp.instance.assetManager.getXmlNames();
        }

        override protected function getData(name:String):Object
        {
            return UIEditorApp.instance.assetManager.getXml(name);
        }
    }
}
