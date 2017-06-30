!function(){var a={},b=function(b){for(var c=a[b],e=c.deps,f=c.defn,g=e.length,h=new Array(g),i=0;i<g;++i)h[i]=d(e[i]);var j=f.apply(null,h);if(void 0===j)throw"module ["+b+"] returned undefined";c.instance=j},c=function(b,c,d){if("string"!=typeof b)throw"module id must be a string";if(void 0===c)throw"no dependencies for "+b;if(void 0===d)throw"no definition function for "+b;a[b]={deps:c,defn:d,instance:void 0}},d=function(c){var d=a[c];if(void 0===d)throw"module ["+c+"] was undefined";return void 0===d.instance&&b(c),d.instance},e=function(a,b){for(var c=a.length,e=new Array(c),f=0;f<c;++f)e.push(d(a[f]));b.apply(null,b)},f={};f.bolt={module:{api:{define:c,require:e,demand:d}}};var g=c,h=function(a,b){g(a,[],function(){return b})};h("1",tinymce.ThemeManager),h("2",tinymce.util.Delay),h("c",tinymce.util.Tools),h("d",tinymce.ui.Factory),h("e",tinymce.DOM),g("j",[],function(){var a=function(a){return function(b){return typeof b===a}},b=function(a){return Array.isArray(a)},c=function(a){return null===a},d=function(a){return function(d){return!c(d)&&!b(d)&&a(d)}};return{isString:a("string"),isNumber:a("number"),isBoolean:a("boolean"),isFunction:a("function"),isObject:d(a("object")),isNull:c,isArray:b}}),g("f",["c","d","j"],function(a,b,c){var d=function(a,b){var c=function(a,b){return{selector:a,handler:b}},d=function(a){b.active(a)},e=function(a){b.disabled(a)};return b.settings.stateSelector?c(b.settings.stateSelector,d):b.settings.disabledStateSelector?c(b.settings.disabledStateSelector,e):null},e=function(a,b,c){return function(){var e=d(b,c);null!==e&&a.selection.selectorChanged(e.selector,e.handler)}},f=function(a){return c.isArray(a)?a:c.isString(a)?a.split(/[ ,]/):[]},g=function(c,d,g){var h,i=[];if(g)return a.each(f(g),function(a){var d;"|"==a?h=null:b.has(a)?(a={type:a},i.push(a),h=null):c.buttons[a]&&(h||(h={type:"buttongroup",items:[]},i.push(h)),d=a,a=c.buttons[d],"function"==typeof a&&(a=a()),a.type=a.type||"button",a=b.create(a),a.on("postRender",e(c,d,a)),h.items.push(a))}),b.create({type:"toolbar",layout:"flow",name:d,items:i})};return{create:g}}),h("o",tinymce.util.Promise),g("p",[],function(){var a=0,b=function(){var a=function(){return Math.round(4294967295*Math.random()).toString(36)};return"s"+Date.now().toString(36)+a()+a()+a()},c=function(c){return c+a++ +b()};return{uuid:c}}),g("u",[],function(){var a=function(a,b){function c(c){var e,f,g;f=b[c?"startContainer":"endContainer"],g=b[c?"startOffset":"endOffset"],1==f.nodeType&&(e=a.create("span",{"data-mce-type":"bookmark"}),f.hasChildNodes()?(g=Math.min(g,f.childNodes.length-1),c?f.insertBefore(e,f.childNodes[g]):a.insertAfter(e,f.childNodes[g])):f.appendChild(e),f=e,g=0),d[c?"startContainer":"endContainer"]=f,d[c?"startOffset":"endOffset"]=g}var d={};return c(!0),b.collapsed||c(),d},b=function(a,b){function c(c){function d(a){for(var b=a.parentNode.firstChild,c=0;b;){if(b==a)return c;1==b.nodeType&&"bookmark"==b.getAttribute("data-mce-type")||c++,b=b.nextSibling}return-1}var e,f,g;e=g=b[c?"startContainer":"endContainer"],f=b[c?"startOffset":"endOffset"],e&&(1==e.nodeType&&(f=d(e),e=e.parentNode,a.remove(g)),b[c?"startContainer":"endContainer"]=e,b[c?"startOffset":"endOffset"]=f)}c(!0),c();var d=a.createRng();return d.setStart(b.startContainer,b.startOffset),b.endContainer&&d.setEnd(b.endContainer,b.endOffset),d};return{create:a,resolve:b}}),h("v",tinymce.dom.TreeWalker),h("w",tinymce.dom.RangeUtils),g("q",["u","c","v","w"],function(a,b,c,d){var e=function(a,b,d){var e,f,g=[];for(e=new c(b,a),f=b;f&&(1===f.nodeType&&g.push(f),f!==d);f=e.next());return g},f=function(c,d){var e,f,g;f=c.dom,g=c.selection,e=a.create(f,g.getRng()),b.each(d,function(a){c.dom.remove(a,!0)}),g.setRng(a.resolve(f,e))},g=function(a){return"A"===a.nodeName&&a.hasAttribute("href")},h=function(a,b){var c=a.getParent(b,g);return c?c:b},i=function(a){var c,f,i,j,k,l,m;return k=a.selection,l=a.dom,m=k.getRng(),c=h(l,d.getNode(m.startContainer,m.startOffset)),f=d.getNode(m.endContainer,m.endOffset),i=a.getBody(),j=b.grep(e(i,c,f),g)},j=function(a){f(a,i(a))};return{unlinkSelection:j}}),g("m",["p","q"],function(a,b){var c=function(a,b){var c,d,e;for(e='<table data-mce-id="mce" style="width: 100%">',e+="<tbody>",d=0;d<b;d++){for(e+="<tr>",c=0;c<a;c++)e+="<td><br></td>";e+="</tr>"}return e+="</tbody>",e+="</table>"},d=function(a){var b=a.dom.select("*[data-mce-id]");return b[0]},e=function(a,b,e){a.undoManager.transact(function(){var f,g;a.insertContent(c(b,e)),f=d(a),f.removeAttribute("data-mce-id"),g=a.dom.select("td,th",f),a.selection.setCursorLocation(g[0],0)})},f=function(a,b){a.execCommand("FormatBlock",!1,b)},g=function(b,c,d){var e,f;e=b.editorUpload.blobCache,f=e.create(a.uuid("mceu"),d,c),e.add(f),b.insertContent(b.dom.createHTML("img",{src:f.blobUri()}))},h=function(a){a.selection.collapse(!1)},i=function(a){a.focus(),b.unlinkSelection(a),h(a)},j=function(a,b,c){a.focus(),a.dom.setAttrib(b,"href",c),h(a)},k=function(a,b){a.execCommand("mceInsertLink",!1,{href:b}),h(a)},l=function(a,b){var c=a.dom.getParent(a.selection.getStart(),"a[href]");c?j(a,c,b):k(a,b)},m=function(a,b){0===b.trim().length?i(a):l(a,b)};return{insertTable:e,formatBlock:f,insertBlob:g,createLink:m,unlink:i}}),g("r",[],function(){var a=function(a){return/^www\.|\.(com|org|edu|gov|uk|net|ca|de|jp|fr|au|us|ru|ch|it|nl|se|no|es|mil)$/i.test(a.trim())},b=function(a){return/^https?:\/\//.test(a.trim())};return{isDomainLike:a,isAbsolute:b}}),g("g",["c","d","o","m","r"],function(a,b,c,d,e){var f=function(a){a.find("textbox").eq(0).each(function(a){a.focus()})},g=function(c,d){var e=b.create(a.extend({type:"form",layout:"flex",direction:"row",padding:5,name:c,spacing:3},d));return e.on("show",function(){f(e)}),e},h=function(a,b){return b?a.show():a.hide()},i=function(a,b){return new c(function(c){a.windowManager.confirm("The URL you entered seems to be an external link. Do you want to add the required http:// prefix?",function(a){var d=a===!0?"http://"+b:b;c(d)})})},j=function(a,b){return!e.isAbsolute(b)&&e.isDomainLike(b)?i(a,b):c.resolve(b)},k=function(a,b){var c={},e=function(){a.focus(),d.unlink(a),b()},f=function(a){var b=a.meta;b&&b.attach&&(c={href:this.value(),attach:b.attach})},i=function(b){if(b.control===this){var c,d="";c=a.dom.getParent(a.selection.getStart(),"a[href]"),c&&(d=a.dom.getAttrib(c,"href")),this.fromJSON({linkurl:d}),h(this.find("#unlink"),c),this.find("#linkurl")[0].focus()}};return g("quicklink",{items:[{type:"button",name:"unlink",icon:"unlink",onclick:e,tooltip:"Remove link"},{type:"filepicker",name:"linkurl",placeholder:"Paste or type a link",filetype:"file",onchange:f},{type:"button",icon:"checkmark",subtype:"primary",tooltip:"Ok",onclick:"submit"}],onshow:i,onsubmit:function(e){j(a,e.data.linkurl).then(function(e){a.undoManager.transact(function(){e===c.href&&(c.attach(),c={}),d.createLink(a,e)}),b()})}})};return{createQuickLinkForm:k}}),h("s",tinymce.geom.Rect),g("t",[],function(){var a=function(a){return{x:a.left,y:a.top,w:a.width,h:a.height}},b=function(a){return{left:a.x,top:a.y,width:a.w,height:a.h,right:a.x+a.w,bottom:a.y+a.h}};return{fromClientRect:a,toClientRect:b}}),g("h",["e","s","t"],function(a,b,c){var d=function(b){var c=a.getViewPort();return{x:b.x+c.x,y:b.y+c.y,w:b.w,h:b.h}},e=function(a){var b=a.getBoundingClientRect();return d({x:b.left,y:b.top,w:Math.max(a.clientWidth,a.offsetWidth),h:Math.max(a.clientHeight,a.offsetHeight)})},f=function(a,b){return e(b)},g=function(a){return e(a.getElement().ownerDocument.body)},h=function(a){return e(a.getContentAreaContainer()||a.getBody())},i=function(a){var b=a.selection.getBoundingClientRect();return b?d(c.fromClientRect(b)):null};return{getElementRect:f,getPageAreaRect:g,getContentAreaRect:h,getSelectionRect:i}}),g("i",["s","t"],function(a,b){var c=function(a,b){return{rect:a,position:b}},d=function(a,b){return{x:b.x,y:b.y,w:a.w,h:a.h}},e=function(b,e,f,g,h){var i,j,k;return i=a.findBestRelativePosition(h,f,g,b),f=a.clamp(f,g),i?(j=a.relativePosition(h,f,i),k=d(h,j),c(k,i)):(f=a.intersect(g,f),f?(i=a.findBestRelativePosition(h,f,g,e))?(j=a.relativePosition(h,f,i),k=d(h,j),c(k,i)):(k=d(h,f),c(k,i)):null)},f=function(a,b,c){return e(["cr-cl","cl-cr"],["bc-tc","bl-tl","br-tr"],a,b,c)},g=function(a,b,c){return e(["tc-bc","bc-tc","tl-bl","bl-tl","tr-br","br-tr"],["bc-tc","bl-tl","br-tr"],a,b,c)},h=function(a,c,d,e){var f;return"function"==typeof a?(f=a({elementRect:b.toClientRect(c),contentAreaRect:b.toClientRect(d),panelRect:b.toClientRect(e)}),b.fromClientRect(f)):e},i=function(a){return a.panelRect};return{calcInsert:f,calc:g,userConstrain:h,defaultHandler:i}}),g("a",["j"],function(a){var b=function(a,b){if(b(a))return!0;throw new Error("Default value doesn't match requested type.")},c=function(a){return function(c,d,e){var f=c.settings;return b(e,a),d in f&&a(f[d])?f[d]:e}},d=function(a,b){return a.split(b).filter(function(a){return a.length>0})},e=function(b,c){var e=function(a){return"string"==typeof a?d(a,/[ ,]/):a},f=function(a,b){return a===!1?[]:b};return a.isArray(b)?b:a.isString(b)?e(b):a.isBoolean(b)?f(b,c):c},f=function(a){return function(c,d,f){var g=d in c.settings?c.settings[d]:f;return b(f,a),e(g,f)}};return{getStringOr:c(a.isString),getBoolOr:c(a.isBoolean),getNumberOr:c(a.isNumber),getHandlerOr:c(a.isFunction),getToolbarItemsOr:f(a.isArray)}}),g("3",["c","d","e","f","g","h","i","a"],function(a,b,c,d,e,f,g,h){return function(){var i,j,k=["bold","italic","|","quicklink","h2","h3","blockquote"],l=["quickimage","quicktable"],m=function(b,c){return a.map(c,function(a){return d.create(b,a.id,a.items)})},n=function(a){return h.getToolbarItemsOr(a,"selection_toolbar",k)},o=function(a){return h.getToolbarItemsOr(a,"insert_toolbar",l)},p=function(a){return a.items().length>0},q=function(c,f){var g=m(c,f).concat([d.create(c,"text",n(c)),d.create(c,"insert",o(c)),e.createQuickLinkForm(c,z)]);return b.create({type:"floatpanel",role:"dialog",classes:"tinymce tinymce-inline arrow",ariaLabel:"Inline toolbar",layout:"flex",direction:"column",align:"stretch",autohide:!1,autofix:!0,fixed:!0,border:1,items:a.grep(g,p),oncancel:function(){c.focus()}})},r=function(a){a&&a.show()},s=function(a,b){a.moveTo(b.x,b.y)},t=function(b,c){c=c?c.substr(0,2):"",a.each({t:"down",b:"up",c:"center"},function(a,d){b.classes.toggle("arrow-"+a,d===c.substr(0,1))}),"cr"===c?(b.classes.toggle("arrow-left",!0),b.classes.toggle("arrow-right",!1)):"cl"===c?(b.classes.toggle("arrow-left",!0),b.classes.toggle("arrow-right",!0)):a.each({l:"left",r:"right"},function(a,d){b.classes.toggle("arrow-"+a,d===c.substr(1,1))})},u=function(a,b){var c=a.items().filter("#"+b);return c.length>0&&(c[0].show(),a.reflow(),!0)},v=function(a,b,d,e){var i,k,l,m;return r(a),a.items().hide(),u(a,b)?(m=h.getHandlerOr(d,"inline_toolbar_position_handler",g.defaultHandler),i=f.getContentAreaRect(d),k=c.getRect(a.getEl()),l="insert"===b?g.calcInsert(e,i,k):g.calc(e,i,k),void(l?(k=l.rect,j=e,s(a,g.userConstrain(m,e,i,k)),t(a,l.position)):z(a))):void z(a)},w=function(){return i.items().filter("form:visible").length>0},x=function(a,b){if(i){if(i.items().hide(),!u(i,b))return void z(i);var d,e,k,l;r(i),i.items().hide(),u(i,b),l=h.getHandlerOr(a,"inline_toolbar_position_handler",g.defaultHandler),d=f.getContentAreaRect(a),e=c.getRect(i.getEl()),k=g.calc(j,d,e),k&&(e=k.rect,s(i,g.userConstrain(l,j,d,e)),t(i,k.position))}},y=function(a,b,c,d){i||(i=q(a,d),i.renderTo(document.body).reflow().moveTo(c.x,c.y),a.nodeChanged()),v(i,b,a,c)},z=function(){i&&i.hide()},A=function(){i&&i.find("toolbar:visible").eq(0).each(function(a){a.focus(!0)})},B=function(){i&&(i.remove(),i=null)},C=function(){return i&&i.visible()&&w()};return{show:y,showForm:x,inForm:C,hide:z,focus:A,remove:B}}}),g("k",["o"],function(a){var b=function(b){return new a(function(a){var c=new FileReader;c.onloadend=function(){a(c.result.split(",")[1])},c.readAsDataURL(b)})};return{blobToBase64:b}}),g("l",["o"],function(a){var b=function(){return new a(function(a){var b;b=document.createElement("input"),b.type="file",b.style.position="fixed",b.style.left=0,b.style.top=0,b.style.opacity=.001,document.body.appendChild(b),b.onchange=function(b){a(Array.prototype.slice.call(b.target.files))},b.click(),b.parentNode.removeChild(b)})};return{pickFile:b}}),g("4",["3","k","l","m"],function(a,b,c,d){var e=function(a){for(var b=function(b){return function(){d.formatBlock(a,b)}},c=1;c<6;c++){var e="h"+c;a.addButton(e,{text:e.toUpperCase(),tooltip:"Heading "+c,stateSelector:e,onclick:b(e),onPostRender:function(){var a=this.getEl().firstChild.firstChild;a.style.fontWeight="bold"}})}},f=function(a,f){a.addButton("quicklink",{icon:"link",tooltip:"Insert/Edit link",stateSelector:"a[href]",onclick:function(){f.showForm(a,"quicklink")}}),a.addButton("quickimage",{icon:"image",tooltip:"Insert image",onclick:function(){c.pickFile().then(function(c){var e=c[0];b.blobToBase64(e).then(function(b){d.insertBlob(a,b,e)})})}}),a.addButton("quicktable",{icon:"table",tooltip:"Insert table",onclick:function(){f.hide(),d.insertTable(a,2,2)}}),e(a)};return{addToEditor:f}}),h("n",tinymce.EditorManager),g("5",["n","e"],function(a,b){var c=function(a,b){var c=function(){a.fire("SkinLoaded"),b()};a.initialized?c():a.on("init",c)},d=function(b){var c=a.baseURL+"/skins/";return b?c+b:c+"lightgray"},e=function(a,b){return a.documentBaseURI.toAbsolute(b)},f=function(a,f){var g=a.settings,h=g.skin_url?e(a,g.skin_url):d(g.skin),i=function(){c(a,f)};b.styleSheetLoader.load(h+"/skin.min.css",i),a.contentCSS.push(h+"/content.inline.min.css")};return{load:f}}),g("8",[],function(){var a=function(a,b){return{id:a,rect:b}},b=function(a,b){for(var c=0;c<b.length;c++){var d=b[c],e=d(a);if(e)return e}return null};return{match:b,result:a}}),g("6",["8","h"],function(a,b){var c=function(c){return function(d){return d.selection.isCollapsed()?null:a.result(c,b.getSelectionRect(d))}},d=function(c,d){return function(e){var f,g=e.schema.getTextBlockElements();for(f=0;f<c.length;f++)if("TABLE"===c[f].nodeName)return null;for(f=0;f<c.length;f++)if(c[f].nodeName in g)return e.dom.isEmpty(c[f])?a.result(d,b.getSelectionRect(e)):null;return null}};return{textSelection:c,emptyTextBlock:d}}),g("7",["8","h"],function(a,b){var c=function(c,d){return function(e){for(var f=0;f<d.length;f++)if(d[f].predicate(c))return a.result(d[f].id,b.getElementRect(e,c));return null}},d=function(c,d){return function(e){for(var f=0;f<c.length;f++)for(var g=0;g<d.length;g++)if(d[g].predicate(c[f]))return a.result(d[g].id,b.getElementRect(e,c[f]));return null}};return{element:c,parent:d}}),g("9",[],function(){var a=function(b){return b.reduce(function(b,c){return Array.isArray(c)?b.concat(a(c)):b.concat(c)},[])};return{flatten:a}}),g("b",["c"],function(a){var b=function(a,b){return{id:a,predicate:b}},c=function(c){return a.map(c,function(a){return b(a.id,a.predicate)})};return{create:b,fromContextToolbars:c}}),g("0",["1","2","3","4","5","6","7","8","9","a","b"],function(a,b,c,d,e,f,g,h,i,j,k){var l=function(a){var b=a.selection.getNode(),c=a.dom.getParents(b);return c},m=function(a,b,c,d){var e=function(c){return a.dom.is(c,b)};return{predicate:e,id:c,items:d}},n=function(a){var b=a.contextToolbars;return i.flatten([b?b:[],m(a,"img","image","alignleft aligncenter alignright")])},o=function(a,b){var c,d,e;return d=l(a),e=k.fromContextToolbars(b),c=h.match(a,[g.element(d[0],e),f.textSelection("text"),f.emptyTextBlock(d,"insert"),g.parent(d,e)]),c&&c.rect?c:null},p=function(a,b){var c=function(){var c=n(a),d=o(a,c);d?b.show(a,d.id,d.rect,c):b.hide()};return function(){a.removed||c()}},q=function(a,b){return function(){a.inForm()||b()}},r=function(a,c){var d=b.throttle(p(a,c),0),e=b.throttle(q(c,p(a,c)),0);a.on("blur hide ObjectResizeStart",c.hide),a.on("click",d),a.on("nodeChange mouseup",e),a.on("ResizeEditor ResizeWindow keyup",d),a.on("remove",c.remove),a.shortcuts.add("Alt+F10","",c.focus)},s=function(a,b){a.shortcuts.remove("meta+k"),a.shortcuts.add("meta+k","",function(){var c=n(a),d=d=h.match(a,[f.textSelection("quicklink")]);d&&b.show(a,d.id,d.rect,c)})},t=function(a,b){return e.load(a,function(){r(a,b),s(a,b)}),{}},u=function(a){throw new Error(a)};return a.add("inlite",function(a){var b=new c;d.addToEditor(a,b);var e=function(){return a.inline?t(a,b):u("inlite theme only supports inline mode.")};return{renderUI:e}}),function(){}}),d("0")()}();