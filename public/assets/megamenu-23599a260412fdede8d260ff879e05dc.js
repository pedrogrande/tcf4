$("#megamenu-button-mobile").click(function(){$(".megamenu").slideToggle(400),$(this).toggleClass("active")}),$(document).ready(function(){$(".megamenu .drop-down").click(function(){$(this).next("div").is(":visible")?$(this).next("div").fadeOut("fast"):($(".megamenu .drop-down-container").fadeOut("fast"),$(this).next("div").slideToggle("slow"))})}),$("body").on("click","ul.tabs > li > a",function(e){var i=$(this).attr("href");"#"==i.charAt(0)&&(e.preventDefault(),$(this).parent().siblings().children("a").removeClass("active"),$(this).addClass("active"),$(i).show().addClass("active").siblings().hide().removeClass("active"))});