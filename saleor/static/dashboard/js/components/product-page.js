import { fabric } from 'fabric';
import { onModalClose } from './async-form';
var canvas = null;
var fontWeight = null;
var fontStyle = null;
var textDecoration = null;
var fontFamily = 'helvetica';
var fill = '#000';
var font_size = '12';
var line_height = '1.4';
var char_spacing = '100';
var current_product_template = null;

const onChangeBackground = (e) => {

    if(!canvas) {
        canvas = window._canvas = new fabric.Canvas('c');
    }

    let width = $('#product_content_id').innerWidth();
    let height = $('#product_content_id').innerHeight();

    canvas.setWidth(width);
    canvas.setHeight(height);

    fabric.Image.fromURL(e.target.src, function (img) {
        let bgImage = img;

        var canvasAspect = width / height;
        var imgAspect = bgImage.width / bgImage.height;
        var left, top, scaleFactor;

        if (canvasAspect >= imgAspect) {
            var scaleFactor = width / bgImage.width;
            left = 0;
            top = -((bgImage.height * scaleFactor) - height) / 2;
        } else {
            var scaleFactor = height / bgImage.height;
            top = 0;
            left = -((bgImage.width * scaleFactor) - width) / 2;

        }

        canvas.setBackgroundImage(bgImage, canvas.renderAll.bind(canvas), {
            top: top,
            left: left,
            originX: 'left',
            originY: 'top',
            scaleX: scaleFactor,
            scaleY: scaleFactor
        });
    });
};

const clearCanvas = () => {
    canvas = null;
    fontWeight = null;
    fontStyle = null;
    textDecoration = null;
    fontFamily = 'helvetica';
    fill = '#000';
    font_size = '12';
    line_height = '1.4';
    char_spacing = '100';
    current_product_template = null;
};

const randomId = () => {
    return Math.floor(Math.random() * 999999) + 1;
};

const extend = (obj, id) => {
    obj.toObject = (function (toObject) {
      return function () {
        return fabric.util.object.extend(toObject.call(this), {
          id: id
        });
      };
    })(obj.toObject);
};

const selectItemAfterAdded = (obj) => {
    if(canvas) {
        canvas.discardActiveObject().renderAll();
        canvas.setActiveObject(obj);
    }

};

const onClickAddText = () => {
    if(canvas) {
        let text = new fabric.IText('hello world', {
          left: 10,
          top: 10,
          fontFamily: 'helvetica',
          angle: 0,
          fill: '#000000',
          scaleX: 0.5,
          scaleY: 0.5,
          fontWeight: '',
          hasRotatingPoint: true
        });
        extend(text, randomId());
        canvas.add(text);
        selectItemAfterAdded(text);
    }

};

const setActiveProp = (name, value) => {
    if(canvas) {
        var object = canvas.getActiveObject();
        if (!object) return;
        object.set(name, value).setCoords();
        canvas.renderAll();
    }
}

const onAlignLeft = () => {
    setActiveProp('textAlign', 'left');
};

const onAlignCenter = () => {
    setActiveProp('textAlign', 'center');
};

const onAlignRight = () => {
    setActiveProp('textAlign', 'right');
};

const onAlignJustify = () => {
    setActiveProp('textAlign', 'justify');
};

const setActiveStyle = (styleName, value, object) => {

    object = object || canvas.getActiveObject();
    if (!object) {
        return;
    }

    if (object.setSelectionStyles && object.isEditing) {
      var style = {};
      style[styleName] = value;
      object.setSelectionStyles(style);
      object.setCoords();
    }
    else {
      object.set(styleName, value);
    }

    object.setCoords();
    canvas.renderAll();
}

const setBold = () => {

    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        fontWeight = !fontWeight;
    }

    setActiveStyle('fontWeight', fontWeight ? 'bold' : '', null);
}

const setFontStyle = () => {
    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        fontStyle = !fontStyle;
    }

    setActiveStyle('fontStyle', fontStyle ? 'italic' : '', null);
};

const setTextDecoration = () => {
    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        textDecoration = !textDecoration;
    }
    setActiveStyle('underline', textDecoration, null);
}

const setFontFamily = () => {
    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        fontFamily = $( ".form-control option:selected" ).text();
    }
    setActiveProp('fontFamily', fontFamily);
}

const setFill = () => {
    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        fill = $('#fill').val();
    }

    setActiveStyle('fill', fill, null);
}

const setFontSize = () => {

    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        font_size = $('#font_size').val();
    }

    setActiveStyle('fontSize', parseInt(font_size), null);
}

const setLineHeight = () => {

    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        line_height = $('#line_height').val();
    }

    setActiveStyle('lineHeight', parseFloat(line_height), null);
}

const setCharSpacing = () => {
    var object = canvas.getActiveObject();
    if (!object) {
        return;
    } else {
        char_spacing = $('#char_spacing').val();
    }
    setActiveStyle('charSpacing', parseInt(char_spacing), null);
}

const removeSelected = () => {
    if(canvas) {
        var activeObject = canvas.getActiveObject(),
          activeGroup = canvas.getActiveObjects();

        if (activeObject) {
          canvas.remove(activeObject);
        }
        else if (activeGroup) {
          var objectsInGroup = activeGroup.getObjects();
          canvas.discardActiveObject();
          objectsInGroup.forEach(function (object) {
            canvas.remove(object);
          });
        }
    }
  }

 const s4 = () => {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
 }

 const guid = () => {
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}

const getDataById = (id) => {
    let dataField = $('#id_product_template').val();
    if(dataField && dataField != '') {

        let objProductTemp = JSON.parse(dataField);
        if(objProductTemp && objProductTemp.hasOwnProperty('list_page')) {
            let itemSuccess = objProductTemp['list_page'].filter(item => {
                if (item.id == id) return item;
            });

            return itemSuccess[0];
        }

    }

    return null;
}

const onClickItem = (e) => {
    var $target = $(e.target)
    current_product_template = getDataById($target[0].previousSibling.id);
}

const initFabricCanvas = () => {

    if(current_product_template) {
        if(!canvas) {
            canvas = window._canvas = new fabric.Canvas('c');
        }

        let width = $('#product_content_id').innerWidth();
        let height = $('#product_content_id').innerHeight();

        canvas.setWidth(width);
        canvas.setHeight(height);

        canvas.loadFromJSON(current_product_template.data, () => {
          canvas.renderAll();
        });
    }

}

const loadCanvasFromJson = (obj) => {

    let listSplitString = window.location.pathname.split('/');

    var linkPopup = $('<a>').attr({
        'id': ('l' + obj.id),
        'class': 'modal-trigger-custom',
        'href': '#base-modal-large',
        'data-href': '/dashboard/products/page/' + listSplitString[5] + '/update/'
    });

    linkPopup.append(
    $('<canvas>').attr({
        'id': obj.id
    }));

    $("#container_product_temp_id").append(linkPopup);

    let canvas_tmp = window._canvas = new fabric.Canvas(obj.id);
    let width_new = $('#container_product_temp_id').innerWidth();

    let height_new = 150;
    if(obj.width && obj.height) {
        height_new = (width_new * obj.height)/obj.width;
    } else {
        height_new = 328;
    }


    canvas_tmp.setWidth(width_new);
    canvas_tmp.setHeight(height_new);

    canvas_tmp.loadFromJSON(obj.data, () => {
      canvas_tmp.renderAll();

    }, function(o, object) {
        object.set('selectable', false);
        object.set('editable', false);
    });
}

 const onClickCreateProductTemplate = () => {
    if(canvas) {
        let json = JSON.stringify(canvas);

        let objProductTemp = {};
        let dataField = $('#id_product_template').val();

        let width = $('#product_content_id').innerWidth();
        let height = $('#product_content_id').innerHeight();

        if(current_product_template) {
            /**
            * edit product template
            * remove all element in view
            * change value hidden field
            **/
            let obj = {
                id: current_product_template.id,
                data: json,
                width: width,
                height: height
            }

            if(dataField && dataField != '') {
                objProductTemp = JSON.parse(dataField);
                if(objProductTemp && objProductTemp.hasOwnProperty('list_page')) {
                    objProductTemp['list_page'] = objProductTemp['list_page'].map(item=>{
                        // remove element
                        $( "#l" + item.id).remove();
                        if(item.id == current_product_template.id) {
                            item = obj;
                        }

                        return item;
                    })
                }
            }

            $('#id_product_template').val(JSON.stringify(objProductTemp));

            // render view
            renderListProductTemplate();
        } else {

            /**
            * create product template
            **/

            let uuid = guid();

            let obj = {
                id: uuid,
                data: json,
                width: width,
                height: height
            }

            loadCanvasFromJson(obj);


            if(!dataField || dataField == '') {

                let listProductTemp = [];
                listProductTemp.push(obj);
                objProductTemp['list_page'] = listProductTemp;

            } else {
                objProductTemp = JSON.parse(dataField);
                if(objProductTemp && objProductTemp.hasOwnProperty('list_page')) {
                    objProductTemp['list_page'].push(obj);
                } else {
                    let listProductTemp = [];
                    listProductTemp.push(obj);
                    objProductTemp['list_page'] = listProductTemp;
                }
            }

            $('#id_product_template').val(JSON.stringify(objProductTemp));
        }

        onModalClose();
    }
 }

const renderListProductTemplate = () => {
    let listProductTemplate = $('#id_product_template').val();
    if(listProductTemplate) {
        let jsonArrayProductTemp = JSON.parse(listProductTemplate);
        if(!jQuery.isEmptyObject(jsonArrayProductTemp)) {
            jsonArrayProductTemp['list_page'].map(item => {
                loadCanvasFromJson(item);
            })
        }
    }
}

$(document).on('click', '#btn_create_id', onClickCreateProductTemplate);
$(document).on('click', 'div.image-item img', onChangeBackground);
$(document).on('click', '#add-text-id', onClickAddText);
$(document).on('click', '#remove-text-id', removeSelected);
$(document).on('click', '#btn-left-id', onAlignLeft);
$(document).on('click', '#btn-center-id', onAlignCenter);
$(document).on('click', '#btn-right-id', onAlignRight);
$(document).on('click', '#btn-justify-id', onAlignJustify);
$(document).on('click', '#bold-id', setBold);
$(document).on('click', '#italic-id', setFontStyle);
$(document).on('click', '#underline-id', setTextDecoration);

$(document).on('click', '#container_product_temp_id div', onClickItem);

$(document).on('change', 'select.form-control', setFontFamily);
$(document).on('change', '#fill', setFill);
$(document).on('change', '#font_size', setFontSize);
$(document).on('change', '#char_spacing', setCharSpacing);
$(document).on('change', '#line_height', setLineHeight);

$(document).ready(function() {
    renderListProductTemplate();
});


export {
  clearCanvas,
  initFabricCanvas
};