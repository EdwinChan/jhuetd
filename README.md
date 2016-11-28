This LaTeX document class conforms to the formatting requirements of Electronic Theses and Dissertations submitted to the Johns Hopkins University. It is based on the document class `memoir`, which provides powerful formatting macros; therefore, this document class is much shorter and cleaner than its older [counterpart](https://github.com/weitzner/jhu-thesis-template).

The user is assumed to be familiar with LaTeX. The first line of the document should be one of the following:

    \documentclass[masters=degree]{jhuetd}
    \documentclass[phd]{jhuetd}

where `degree` can be `Fine Arts`, `Science`, and so on. The document class inherits most of its formatting macros from `memoir`; the user is referred to the [documentation](https://www.ctan.org/pkg/memoir) of the latter. There are only two new features:

* the environment `dedication`, which is an empty centered page suitable for dedications; and
* `\marginparfont`, which sets the font of margin paragraphs, for example, `\marginparfont{\footnotesize\raggedright\SingleSpacing}`.

Chapter styles for `memoir` are available online.
