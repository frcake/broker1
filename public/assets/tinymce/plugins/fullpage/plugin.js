tinymce.PluginManager.add("fullpage",function(a){function b(){var b=c();a.windowManager.open({title:"Document properties",data:b,defaults:{type:"textbox",size:40},body:[{name:"title",label:"Title"},{name:"keywords",label:"Keywords"},{name:"description",label:"Description"},{name:"robots",label:"Robots"},{name:"author",label:"Author"},{name:"docencoding",label:"Encoding"}],onSubmit:function(a){d(tinymce.extend(b,a.data))}})}function c(){function b(a,b){var c=a.attr(b);return c||""}var c,d,f=e(),g={};return g.fontface=a.getParam("fullpage_default_fontface",""),g.fontsize=a.getParam("fullpage_default_fontsize",""),c=f.firstChild,7==c.type&&(g.xml_pi=!0,d=/encoding="([^"]+)"/.exec(c.value),d&&(g.docencoding=d[1])),c=f.getAll("#doctype")[0],c&&(g.doctype="<!DOCTYPE"+c.value+">"),c=f.getAll("title")[0],c&&c.firstChild&&(g.title=c.firstChild.value),k(f.getAll("meta"),function(a){var b,c=a.attr("name"),d=a.attr("http-equiv");c?g[c.toLowerCase()]=a.attr("content"):"Content-Type"==d&&(b=/charset\s*=\s*(.*)\s*/gi.exec(a.attr("content")),b&&(g.docencoding=b[1]))}),c=f.getAll("html")[0],c&&(g.langcode=b(c,"lang")||b(c,"xml:lang")),g.stylesheets=[],tinymce.each(f.getAll("link"),function(a){"stylesheet"==a.attr("rel")&&g.stylesheets.push(a.attr("href"))}),c=f.getAll("body")[0],c&&(g.langdir=b(c,"dir"),g.style=b(c,"style"),g.visited_color=b(c,"vlink"),g.link_color=b(c,"link"),g.active_color=b(c,"alink")),g}function d(b){function c(a,b,c){a.attr(b,c?c:void 0)}function d(a){g.firstChild?g.insert(a,g.firstChild):g.append(a)}var f,g,h,j,m,n=a.dom;f=e(),g=f.getAll("head")[0],g||(j=f.getAll("html")[0],g=new l("head",1),j.firstChild?j.insert(g,j.firstChild,!0):j.append(g)),j=f.firstChild,b.xml_pi?(m='version="1.0"',b.docencoding&&(m+=' encoding="'+b.docencoding+'"'),7!=j.type&&(j=new l("xml",7),f.insert(j,f.firstChild,!0)),j.value=m):j&&7==j.type&&j.remove(),j=f.getAll("#doctype")[0],b.doctype?(j||(j=new l("#doctype",10),b.xml_pi?f.insert(j,f.firstChild):d(j)),j.value=b.doctype.substring(9,b.doctype.length-1)):j&&j.remove(),j=null,k(f.getAll("meta"),function(a){"Content-Type"==a.attr("http-equiv")&&(j=a)}),b.docencoding?(j||(j=new l("meta",1),j.attr("http-equiv","Content-Type"),j.shortEnded=!0,d(j)),j.attr("content","text/html; charset="+b.docencoding)):j&&j.remove(),j=f.getAll("title")[0],b.title?(j?j.empty():(j=new l("title",1),d(j)),j.append(new l("#text",3)).value=b.title):j&&j.remove(),k("keywords,description,author,copyright,robots".split(","),function(a){var c,e,g=f.getAll("meta"),h=b[a];for(c=0;c<g.length;c++)if(e=g[c],e.attr("name")==a)return void(h?e.attr("content",h):e.remove());h&&(j=new l("meta",1),j.attr("name",a),j.attr("content",h),j.shortEnded=!0,d(j))});var o={};tinymce.each(f.getAll("link"),function(a){"stylesheet"==a.attr("rel")&&(o[a.attr("href")]=a)}),tinymce.each(b.stylesheets,function(a){o[a]||(j=new l("link",1),j.attr({rel:"stylesheet",text:"text/css",href:a}),j.shortEnded=!0,d(j)),delete o[a]}),tinymce.each(o,function(a){a.remove()}),j=f.getAll("body")[0],j&&(c(j,"dir",b.langdir),c(j,"style",b.style),c(j,"vlink",b.visited_color),c(j,"link",b.link_color),c(j,"alink",b.active_color),n.setAttribs(a.getBody(),{style:b.style,dir:b.dir,vLink:b.visited_color,link:b.link_color,aLink:b.active_color})),j=f.getAll("html")[0],j&&(c(j,"lang",b.langcode),c(j,"xml:lang",b.langcode)),g.firstChild||g.remove(),h=new tinymce.html.Serializer({validate:!1,indent:!0,apply_source_formatting:!0,indent_before:"head,html,body,meta,title,script,link,style",indent_after:"head,html,body,meta,title,script,link,style"}).serialize(f),i=h.substring(0,h.indexOf("</body>"))}function e(){return new tinymce.html.DomParser({validate:!1,root_name:"#document"}).parse(i)}function f(b){function c(a){return a.replace(/<\/?[A-Z]+/g,function(a){return a.toLowerCase()})}var d,f,h,l,m=b.content,n="",o=a.dom;if(!b.selection&&!("raw"==b.format&&i||b.source_view&&a.getParam("fullpage_hide_in_source_view"))){0!==m.length||b.source_view||(m=tinymce.trim(i)+"\n"+tinymce.trim(m)+"\n"+tinymce.trim(j)),m=m.replace(/<(\/?)BODY/gi,"<$1body"),d=m.indexOf("<body"),d!=-1?(d=m.indexOf(">",d),i=c(m.substring(0,d+1)),f=m.indexOf("</body",d),f==-1&&(f=m.length),b.content=m.substring(d+1,f),j=c(m.substring(f))):(i=g(),j="\n</body>\n</html>"),h=e(),k(h.getAll("style"),function(a){a.firstChild&&(n+=a.firstChild.value)}),l=h.getAll("body")[0],l&&o.setAttribs(a.getBody(),{style:l.attr("style")||"",dir:l.attr("dir")||"",vLink:l.attr("vlink")||"",link:l.attr("link")||"",aLink:l.attr("alink")||""}),o.remove("fullpage_styles");var p=a.getDoc().getElementsByTagName("head")[0];n&&(o.add(p,"style",{id:"fullpage_styles"},n),l=o.get("fullpage_styles"),l.styleSheet&&(l.styleSheet.cssText=n));var q={};tinymce.each(p.getElementsByTagName("link"),function(a){"stylesheet"==a.rel&&a.getAttribute("data-mce-fullpage")&&(q[a.href]=a)}),tinymce.each(h.getAll("link"),function(a){var b=a.attr("href");return!b||(q[b]||"stylesheet"!=a.attr("rel")||o.add(p,"link",{rel:"stylesheet",text:"text/css",href:b,"data-mce-fullpage":"1"}),void delete q[b])}),tinymce.each(q,function(a){a.parentNode.removeChild(a)})}}function g(){var b,c="",d="";return a.getParam("fullpage_default_xml_pi")&&(c+='<?xml version="1.0" encoding="'+a.getParam("fullpage_default_encoding","ISO-8859-1")+'" ?>\n'),c+=a.getParam("fullpage_default_doctype","<!DOCTYPE html>"),c+="\n<html>\n<head>\n",(b=a.getParam("fullpage_default_title"))&&(c+="<title>"+b+"</title>\n"),(b=a.getParam("fullpage_default_encoding"))&&(c+='<meta http-equiv="Content-Type" content="text/html; charset='+b+'" />\n'),(b=a.getParam("fullpage_default_font_family"))&&(d+="font-family: "+b+";"),(b=a.getParam("fullpage_default_font_size"))&&(d+="font-size: "+b+";"),(b=a.getParam("fullpage_default_text_color"))&&(d+="color: "+b+";"),c+="</head>\n<body"+(d?' style="'+d+'"':"")+">\n"}function h(b){b.selection||b.source_view&&a.getParam("fullpage_hide_in_source_view")||(b.content=tinymce.trim(i)+"\n"+tinymce.trim(b.content)+"\n"+tinymce.trim(j))}var i,j,k=tinymce.each,l=tinymce.html.Node;a.addCommand("mceFullPageProperties",b),a.addButton("fullpage",{title:"Document properties",cmd:"mceFullPageProperties"}),a.addMenuItem("fullpage",{text:"Document properties",cmd:"mceFullPageProperties",context:"file"}),a.on("BeforeSetContent",f),a.on("GetContent",h)});