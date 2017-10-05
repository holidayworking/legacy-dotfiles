# Mac OS X ではグラフィックデバイスを quartz に設定
if (capabilities("aqua")) {
    options(device="quartz")
}

# グラフのフォント設定
# http://blog.0093.tv/2011/05/rstudio-for-mac-os-x.html
setHook(packageEvent("grDevices", "onLoad"), function(...){
        if(.Platform$OS.type == "windows")
            grDevices::windowsFonts(sans ="MS Gothic",
                                    serif="MS Mincho",
                                    mono ="FixedFont")
        if(capabilities("aqua"))
            grDevices::quartzFonts(
                                   sans =grDevices::quartzFont(
                                                               c("Hiragino Kaku Gothic Pro W3",
                                                                 "Hiragino Kaku Gothic Pro W6",
                                                                 "Hiragino Kaku Gothic Pro W3",
                                                                 "Hiragino Kaku Gothic Pro W6")),
                                   serif=grDevices::quartzFont(
                                                               c("Hiragino Mincho Pro W3",
                                                                 "Hiragino Mincho Pro W6",
                                                                 "Hiragino Mincho Pro W3",
                                                                 "Hiragino Mincho Pro W6")))
        if(capabilities("X11"))
            grDevices::X11.options(
                                   fonts=c("-kochi-gothic-%s-%s-*-*-%d-*-*-*-*-*-*-*",
                                           "-adobe-symbol-medium-r-*-*-%d-*-*-*-*-*-*-*"))
            grDevices::pdf.options(family="Japan1GothicBBB")
            grDevices::ps.options(family="Japan1GothicBBB")
})

attach(NULL, name = "JapanEnv")
assign("familyset_hook", function() {
       winfontdevs=c("windows","win.metafile", "png","bmp","jpeg","tiff", "RStudioGD")
       macfontdevs=c("quartz","quartz_off_screen", "RStudioGD")
       devname=strsplit(names(dev.cur()),":")[[1L]][1]
       if ((.Platform$OS.type == "windows") && (devname %in% winfontdevs)) par(family="sans")
       if (capabilities("aqua") && devname %in% macfontdevs) par(family="sans")
}, pos="JapanEnv")
setHook("plot.new", get("familyset_hook", pos="JapanEnv"))
setHook("persp", get("familyset_hook", pos="JapanEnv"))

# 自作関数
exit <- function() {
    quit(save="no")
}

KnitPost <- function(input, base.url = "/") {
    require(knitr)
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("images/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, envir = parent.frame())
}

options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    require(knitrBootstrap)
    knit_bootstrap_md(input=inputFile, output=outputFile)
  }
)
