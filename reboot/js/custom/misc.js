// Select Dropdown OnChange Submit Form
//--------------------------------------------

function select_go(targ,selObj,restore){
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
}

// Placeholder Fix for IE
//--------------------------------------------

// if($.browser.msie && parseFloat($.browser.version)<=9){
//     $(document).ready(function(){if(!Modernizr.input.placeholder)$("input").each(function(){if($(this).val()==""&&$(this).attr("placeholder")!=""){$(this).val($(this).attr("placeholder"));$(this).focus(function(){if($(this).val()==$(this).attr("placeholder"))$(this).val("")});$(this).blur(function(){if($(this).val()=="")$(this).val($(this).attr("placeholder"))})}})});
// };

// FluidVids.js
// https://github.com/toddmotto/fluidvids
//--------------------------------------------

window.fluidvids=function(a,b){"use strict";var c=function(a){this.elem=a};c.prototype={init:function(){var a=100*(this.elem.height/this.elem.width);this.elem.style.position="absolute",this.elem.style.top="0",this.elem.style.left="0",this.elem.width="100%",this.elem.height="100%";var c=b.createElement("div");c.className="fluidvids",c.style.width="100%",c.style.position="relative",c.style.paddingTop=a+"%";var d=this.elem.parentNode;d.insertBefore(c,this.elem),c.appendChild(this.elem)}};for(var d=b.getElementsByTagName("iframe"),e=0;e<d.length;e++){var f=/www.youtube.com|player.vimeo.com/;d[e].src.search(f)>0&&new c(d[e]).init()}}(window,document);

// Thumbnail Slider
// http://www.starplugins.com/thumbelina
//--------------------------------------------

;(function($){$.fn.Thumbelina=function(settings){var $container=this,$list=$("ul",this),moveDir=0,pos=0,destPos=0,listDimension=0,idle=0,outerFunc,orientData;$list.addClass("thumbelina").wrap('<div style="position:absolute;overflow:hidden;width:100%;height:100%;">');settings=$.extend({},$.fn.Thumbelina.defaults,settings);if(settings.orientation==="vertical")orientData={outerSizeFunc:"outerHeight",cssAttr:"top",display:"block"};else orientData={outerSizeFunc:"outerWidth",cssAttr:"left",display:"inline-block"};
    $("li",$list).css({display:orientData.display});var bindButEvents=function($elem,dir){$elem.bind("mousedown mouseup touchend touchstart",function(evt){if(evt.type==="mouseup"||evt.type==="touchend")moveDir=0;else moveDir=dir;return false})};bindButEvents(settings.$bwdBut,1);bindButEvents(settings.$fwdBut,-1);outerFunc=orientData.outerSizeFunc;var animate=function(){var minPos;if(!moveDir&&(pos===destPos&&listDimension===$container[outerFunc]())){idle++;if(idle>100)return}else{listDimension=$container[outerFunc]();
        idle=0}destPos+=settings.maxSpeed*moveDir;minPos=listDimension-$list[outerFunc]();if(minPos>0)minPos=0;if(destPos<minPos)destPos=minPos;if(destPos>0)destPos=0;if(destPos===minPos)settings.$fwdBut.addClass("disabled");else settings.$fwdBut.removeClass("disabled");if(destPos===0)settings.$bwdBut.addClass("disabled");else settings.$bwdBut.removeClass("disabled");pos+=(destPos-pos)/settings.easing;if(Math.abs(destPos-pos)<0.001)pos=destPos;$list.css(orientData.cssAttr,Math.floor(pos))};setInterval(function(){animate()},
        1E3/60)};$.fn.Thumbelina.defaults={orientation:"horizontal",easing:8,maxSpeed:5,$bwdBut:null,$fwdBut:null}})(jQuery);

// Flickr Feed
// http://www.newmediacampaigns.com/page/jquery-flickr-plugin
//--------------------------------------------

;(function($){$.fn.jflickrfeed=function(settings,callback){settings=$.extend(true,{flickrbase:'http://api.flickr.com/services/feeds/',feedapi:'photos_public.gne',limit:20,qstrings:{lang:'en-us',format:'json',jsoncallback:'?'},cleanDescription:true,useTemplate:true,itemTemplate:'',itemCallback:function(){}},settings);var url=settings.flickrbase+settings.feedapi+'?';var first=true;for(var key in settings.qstrings){if(!first)
    url+='&';url+=key+'='+settings.qstrings[key];first=false;}
    return $(this).each(function(){var $container=$(this);var container=this;$.getJSON(url,function(data){$.each(data.items,function(i,item){if(i<settings.limit){if(settings.cleanDescription){var regex=/<p>(.*?)<\/p>/g;var input=item.description;if(regex.test(input)){item.description=input.match(regex)[2]
        if(item.description!=undefined)
            item.description=item.description.replace('<p>','').replace('</p>','');}}
        item['image_s']=item.media.m.replace('_m','_s');item['image_t']=item.media.m.replace('_m','_t');item['image_m']=item.media.m.replace('_m','_m');item['image']=item.media.m.replace('_m','');item['image_b']=item.media.m.replace('_m','_b');delete item.media;if(settings.useTemplate){var template=settings.itemTemplate;for(var key in item){var rgx=new RegExp('{{'+key+'}}','g');template=template.replace(rgx,item[key]);}
            $container.append(template)}
        settings.itemCallback.call(container,item);}});if($.isFunction(callback)){callback.call(container,data);}});});}})(jQuery);

// Rotator
//--------------------------------------------

(function($){$.quote_rotator={defaults:{rotation_speed:5E3,pause_on_hover:true,randomize_first_quote:false,buttons:false}};$.fn.extend({quote_rotator:function(config){var config=$.extend({},$.quote_rotator.defaults,config);return this.each(function(){var rotation;var quote_list=$(this);var list_items=quote_list.find("li");var rotation_active=true;var rotation_speed=config.rotation_speed<2E3?2E3:config.rotation_speed;var add_active_class=function(){var active_class_not_already_applied=quote_list.find("li.active").length===
        0;if(config.randomize_first_quote){var random_list_item=$(list_items[Math.floor(Math.random()*list_items.length)]);random_list_item.addClass("active")}else if(active_class_not_already_applied)quote_list.find("li:first").addClass("active")}();var get_next_quote=function(quote){return quote.next("li").length?quote.next("li"):quote_list.find("li:first")};var get_previous_quote=function(quote){return quote.prev("li").length?quote.prev("li"):quote_list.find("li:last")};var rotate_quotes=function(direction){var active_quote=
        quote_list.find("li.active");var next_quote=direction==="forward"?get_next_quote(active_quote):get_previous_quote(active_quote);active_quote.animate({opacity:0},1E3,function(){active_quote.hide();list_items.css("opacity",1);next_quote.fadeIn(1E3)});active_quote.removeClass("active");next_quote.addClass("active")};var start_automatic_rotation=function(){rotation=setInterval(function(){if(rotation_active)rotate_quotes("forward")},rotation_speed)};var pause_rotation_on_hover=function(){quote_list.hover(function(){rotation_active=false},function(){rotation_active=true})};var include_next_previous_buttons=function(){quote_list.append('<div class="qr_buttons"><button class="qr_previous btn btn-custom btn-sm">'+config.buttons.previous+'</button>&nbsp;<button class="qr_next btn btn-custom btn-sm">'+config.buttons.next+"</button></div>");quote_list.find("button").click(function(){clearInterval(rotation);rotate_quotes($(this).hasClass("qr_next")?"forward":"backward");start_automatic_rotation()})};if(config.buttons)include_next_previous_buttons();if(config.pause_on_hover)pause_rotation_on_hover();list_items.not(".active").hide();start_automatic_rotation()})}})})(jQuery);

// Mouse Wheel Scrolling Fix
//--------------------------------------------

//function handle(delta){var d=delta*-30;window.scrollBy(0,d)}function wheel(event){var delta=0;if(!event)event=window.event;if(event.wheelDelta){delta=event.wheelDelta/120;if(window.opera)delta=-delta}else if(event.detail)delta=-event.detail/1;if(delta)handle(delta);if(event.preventDefault)event.preventDefault();event.returnValue=false}if(window.addEventListener)window.addEventListener("DOMMouseScroll",wheel,false);window.onmousewheel=document.onmousewheel=wheel;

// Side Panel
//--------------------------------------------

(function($){$.fn.dcSlick=function(options){var defaults={classWrapper:"dc-slick",classContent:"dc-slick-content",idWrapper:"dc-slick-"+$(this).index(),location:"left",align:"top",offset:"100px",speed:"slow",tabText:"Click",classTab:"tab",classOpen:"slick-open",classClose:"slick-close",classToggle:"slick-toggle",autoClose:true,loadOpen:false,onLoad:function(){},beforeOpen:function(){},beforeClose:function(){}};var options=$.extend(defaults,options);var $dcSlickObj=this;return $dcSlickObj.each(function(options){var clWrap=
    defaults.classWrapper;var slickHtml=$dcSlickObj.html();$dcSlickObj.css("float","left");var objWidth=$dcSlickObj.width();$dcSlickObj.empty();var slickTab='<div class="'+defaults.classTab+'"><span>'+defaults.tabText+"</span></div>";$(this).hide();var idWrapper=defaults.idWrapper;var slider='<div id="'+idWrapper+'" class="'+clWrap+'">'+slickTab+'<div class="'+defaults.classContent+'">'+slickHtml+"</div></div>";$("body").append(slider);var $slider=$("#"+idWrapper);var $tab=$("."+defaults.classTab,$slider);
    $tab.css({position:"absolute"});var linkOpen=$("."+defaults.classOpen);var linkClose=$("."+defaults.classClose);var linkToggle=$("."+defaults.classToggle);var height=$slider.height();$slider.css("float","left");var outerW=$slider.outerWidth();var widthPx=outerW+"px";$slider.css("float","none");var outerH=$slider.outerHeight();var padH=outerH-height;var heightPx=outerH+"px";var bodyHeight=$(window).height();slickSetup($slider);if(defaults.autoClose==true)$("body").mouseup(function(e){if($slider.hasClass("active"))if(!$(e.target).parents("#"+
        defaults.idWrapper).length)if(!($(e.target).hasClass(defaults.classOpen)||$(e.target).hasClass(defaults.classToggle)))slickClose()});$tab.click(function(){if($slider.hasClass("active"))slickClose();else slickOpen()});$(linkOpen).click(function(e){slickOpen();e.preventDefault()});$(linkClose).click(function(e){if($slider.hasClass("active"))slickClose();e.preventDefault()});$(linkToggle).click(function(e){if($slider.hasClass("active"))slickClose();else slickOpen();e.preventDefault()});if(defaults.loadOpen==
        true)slickOpen();function slickOpen(){$("."+clWrap).css({zIndex:1E4});$slider.css({zIndex:10001});if(defaults.location=="bottom")$slider.animate({marginBottom:"-=5px"},"fast").animate({marginBottom:0},defaults.speed);if(defaults.location=="top")$slider.animate({marginTop:"-=5px"},"fast").animate({marginTop:0},defaults.speed);if(defaults.location=="left")$slider.animate({marginLeft:"-=5px"},"fast").animate({marginLeft:0},defaults.speed);if(defaults.location=="right")$slider.animate({marginRight:"-=5px"},
        "fast").animate({marginRight:0},defaults.speed);$slider.addClass("active");defaults.beforeOpen.call(this)}function slickClose(){$slider.css({zIndex:1E4});if($slider.hasClass("active")){var params={"marginBottom":"-"+heightPx};switch(defaults.location){case "top":params={"marginTop":"-"+heightPx};break;case "left":params={"marginLeft":"-"+widthPx};break;case "right":params={"marginRight":"-"+widthPx};break}$slider.removeClass("active").animate(params,defaults.speed)}defaults.beforeClose.call(this)}
    function slickSetup(obj){var $container=$("."+defaults.classContent,obj);$(obj).addClass(defaults.location).addClass("align-"+defaults.align).css({position:"fixed",zIndex:1E4});var bdrTop=$slider.css("border-top-width");var bdrRight=$slider.css("border-right-width");var bdrBottom=$slider.css("border-bottom-width");var bdrLeft=$slider.css("border-left-width");var $tab=$("."+defaults.classTab,$slider);var tabWidth=$tab.outerWidth(true);var tabWidthPx=tabWidth+"px";var tabHeight=$tab.outerHeight(true);
        var tabHeightPx=tabHeight+"px";var containerH=$container.height();var containerPad=$container.outerHeight(true)-containerH;var maxHeight=bodyHeight-tabHeight;if(outerH>maxHeight){containerH=maxHeight-padH-containerPad;heightPx=maxHeight+"px"}$container.css({height:containerH+"px"});var params={marginLeft:"-"+widthPx,top:defaults.offset};var paramsTab={marginRight:"-"+tabWidthPx};if(defaults.location=="right"){params={marginRight:"-"+widthPx,top:defaults.offset};paramsTab={marginLeft:"-"+tabWidthPx}}if(defaults.location==
            "top"){params={marginTop:"-"+heightPx};paramsTab={marginBottom:"-"+tabHeightPx};if(defaults.align=="left"){params={marginTop:"-"+heightPx,left:defaults.offset};paramsTab={marginBottom:"-"+tabHeightPx,left:0}}else{params={marginTop:"-"+heightPx,right:defaults.offset};paramsTab={marginBottom:"-"+tabHeightPx,right:0}}}if(defaults.location=="bottom"){params={marginBottom:"-"+heightPx};paramsTab={marginTop:"-"+tabHeightPx};if(defaults.align=="left"){params={marginBottom:"-"+heightPx,left:defaults.offset};
            paramsTab={marginTop:"-"+tabHeightPx,left:0}}else{params={marginBottom:"-"+heightPx,right:defaults.offset};paramsTab={marginTop:"-"+tabHeightPx,right:0}}}$(obj).css(params);$tab.css(paramsTab);defaults.onLoad.call(this)}})}})(jQuery);

// Randomise Anything
// $('.selector').randomize();
//--------------------------------------------

$.fn.randomize=function(selector){var $elems=selector?$(this).find(selector):$(this).children(),$parents=$elems.parent();$parents.each(function(){$(this).children(selector).sort(function(){return Math.round(Math.random())-0.5}).remove().appendTo(this)});return this};
