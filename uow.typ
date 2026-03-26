/**
usage:
#import "@template/uow:1.0.0": init
#show: init.with(
 course: "info",
 task: "Assignment 1"
)
*/

// course name setting
#let course_name = (
    info: "COMPX532: Information Visualisation",
    tool: "COMPX575: Programming Tools and Techniques",
    cyber: "COMPX511: Cyber Security Operations",
    parallel: "COMPX553: Extremely Parallel Programming",
)
#let init(course:"", task:"", name:"Bowen Luo", id:"1656808", content) = {

    show title: set align(center)
    show link: it => {
        underline(text(blue, it))
    }
    set page(numbering: "1")
    set pagebreak(weak: true)
    show heading.where(level: 1): it => {
        it
        v(10pt)
    }

    // RAW setting
    set raw(theme: "monokai-vivid.tmTheme")
    show raw: it => {
        text(rgb("#f8f8f2"), it)
    }
    show raw.where(block: false): box.with(
        fill: rgb("#1f211c"),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )
    show raw.where(block: true): block.with(
        fill: rgb("#1f211c"),
        inset: 10pt,
        radius: 4pt,
    )


    set document(
        title: [#course_name.at(course, default:"Unknown Course") \ #task],
    )
    let author() = {
        align(center)[#smallcaps(name) \ ID: #id]
    }

    title()
    author()
    content

}
