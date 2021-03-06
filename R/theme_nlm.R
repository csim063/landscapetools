#' theme_nlm
#'
#' @description Opinionated ggplot2 theme to visualize NLM raster.
#'
#' @param base_family  base font family size
#' @param base_size  base font size
#' @param plot_title_family plot title family
#' @param plot_title_face  plot title face
#' @param plot_title_size  plot title size
#' @param plot_title_margin plot title ggplot2::margin
#' @param plot_margin plot ggplot2::margin (specify with `ggplot2::margin``)
#' @param subtitle_family plot subtitle family
#' @param subtitle_face  plot subtitle face
#' @param subtitle_size plot subtitle size
#' @param subtitle_margin
#' plot subtitle ggplot2::margin bottom (single numeric value)
#' @param strip_text_family facet facet label font family
#' @param strip_text_face  facet facet label font face
#' @param strip_text_size facet label font family, face and size
#' @param strip.background strip background
#' @param caption_family plot caption family
#' @param caption_face plot caption face
#' @param caption_size plot caption size
#' @param caption_margin plot caption ggplot2::margin
#' @param axis_text_size axis text size
#' @param axis_title_family axis title family
#' @param axis_title_size axis title size
#' @param axis_title_face axis title face
#' @param axis_title_just axis title justification
#' @param grid_col grid color
#' @param grid grid TRUE/FALSE
#' @param axis_col axis color
#' @param axis axis TRUE/FALSE
#' @param ticks ticks TRUE/FALSE
#' @param legend_title Title of the legend (default `"Z"`)
#' @param legend_labels Labels for the legend ticks, if
#' used with \code{\link{util_plot}} they are automatically derived.
#' @param legend_text_size legend text size, default 8
#' @param legend_title_size legend text size, default 10
#' @param ratio
#' ratio for tiles (default 1, if your raster is not a square the ratio should
#' be \code{raster::nrow(x) / raster::ncol(x)})
#' @param viridis_scale
#' Five options are available: "viridis - magma" (= "A"),
#'                             "viridis - inferno" (= "B"),
#'                             "viridis - plasma" (= "C"),
#'                             "viridis - viridis" (= "D",  the default option),
#'                             "viridis - cividis" (= "E")
#' @param ... optional arguments to ggplot2::theme
#' @details
#' A focused theme to visualize raster data that sets a lot of defaults for the
#' \code{ggplot2::theme}.
#'
#' The theme can make use of the Roboto Condensed font (Open Source font from
#' Google).
#' If your local font library does not contain Roboto as a font, you can
#' import it via \code{\link{util_import_roboto_condensed}} (highly recommended).
#'
#' The functions are setup in such a way that you can customize your own one by
#' just wrapping the call and changing the parameters.
#' The theme itself is heavily influenced by hrbrmstr and his package
#' hrbrthemes (\url{https://github.com/hrbrmstr/hrbrthemes/}).
#'
#' @seealso \code{\link{util_import_roboto_condensed}}
#'
#' @examples
#' # nolint start
#' \dontrun{
#' # provided example map
#' x <- fbmmap
#' # classify
#' y <- c(0.5, 0.15, 0.25)
#' y <- util_classify(x, y, c("1", "2", "3"))
#'
#' # color + continuous
#' rasterVis::gplot(x) +
#'   ggplot2::geom_tile(ggplot2::aes(fill = value)) +
#'   ggplot2::labs(x = "Easting",
#'                 y = "Northing") +
#'   theme_nlm() +
#'   ggplot2::ggtitle("Example map",
#'                    subtitle = "with continuous viridis color scale") +
#'   ggplot2::labs(caption = "Example map simulated with the R package nlmr.")
#'
#' # grey + continuous
#' rasterVis::gplot(x) +
#'   ggplot2::geom_tile(ggplot2::aes(fill = value)) +
#'   ggplot2::labs(x = "Easting",
#'                 y = "Northing") +
#'   theme_nlm_grey() +
#'   ggplot2::ggtitle("Example map",
#'                    subtitle = "with continuous grey color scale") +
#'   ggplot2::labs(caption = "Example map simulated with the R package nlmr.")
#'
#' # color + discrete
#' rasterVis::gplot(y) +
#'   ggplot2::geom_tile(ggplot2::aes(fill = factor(value))) +
#'   ggplot2::labs(x = "Easting",
#'                 y = "Northing") +
#'   theme_nlm_discrete() +
#'   ggplot2::ggtitle("Example map",
#'                    subtitle = "with discrete viridis color scale") +
#'   ggplot2::labs(caption = "Random map simulated with the R package nlmr.")
#'
#' # grey + discrete
#' rasterVis::gplot(y) +
#'   ggplot2::geom_tile(ggplot2::aes(fill = factor(value))) +
#'   ggplot2::labs(x = "Easting",
#'                 y = "Northing") +
#'   theme_nlm_grey_discrete() +
#'   ggplot2::ggtitle("Example map",
#'                    subtitle = "with discrete grey color scale") +
#'   ggplot2::labs(caption = "Random map simulated with the R package nlmr.")
#' # nolint end
#' }
#'
#' @aliases theme_nlm
#' @rdname theme_nlm
#' @name theme_nlm
#'
NULL

#' @rdname theme_nlm
#' @export
theme_nlm <- function(base_family = "Roboto Condensed",
                      base_size = 11.5,
                      plot_title_family = base_family,
                      plot_title_size = 18,
                      plot_title_face = "bold",
                      plot_title_margin = 10,
                      subtitle_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                      subtitle_size = 13,
                      subtitle_face = "plain",
                      subtitle_margin = 15,
                      strip_text_family = base_family,
                      strip_text_size = 12,
                      strip_text_face = "plain",
                      strip.background = "grey80",
                      caption_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                      caption_size = 9,
                      caption_face = "plain",
                      caption_margin = 10,
                      axis_text_size = base_size,
                      axis_title_family = base_family,
                      axis_title_size = 9,
                      axis_title_face = "plain",
                      axis_title_just = "rt",
                      plot_margin = ggplot2::margin(0, 0, 0, 0),
                      grid_col = "#cccccc",
                      grid = TRUE,
                      axis_col = "#cccccc",
                      axis = FALSE,
                      ticks = FALSE,
                      legend_title = "Z",
                      legend_labels = NULL,
                      legend_text_size  = 8,
                      legend_title_size = 10,
                      ratio = 1,
                      viridis_scale = "D",
                      ...) {
  # start with minimal theme
  ret <-
    ggplot2::theme_minimal(base_family = base_family, base_size = base_size)


  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)


  # extend it
  theme_base <- ret + ggplot2::theme(
    legend.background = ggplot2::element_blank(),
    legend.text  = ggplot2::element_text(size = legend_text_size),
    legend.title = ggplot2::element_text(size = legend_title_size),
    aspect.ratio = ratio,
    plot.margin = plot_margin,
    strip.text = ggplot2::element_text(
      hjust = 0,
      size = strip_text_size,
      face = strip_text_face,
      family = strip_text_family
    ),
    strip.background = ggplot2::element_rect(fill = strip.background),
    panel.spacing = grid::unit(2, "lines"),
    plot.title = ggplot2::element_text(
      hjust = 0,
      size = plot_title_size,
      margin = ggplot2::margin(b = plot_title_margin),
      family = plot_title_family,
      face = plot_title_face
    ),
    plot.subtitle = ggplot2::element_text(
      hjust = 0,
      size = subtitle_size,
      margin = ggplot2::margin(b = subtitle_margin),
      family = subtitle_family,
      face = subtitle_face
    ),
    plot.caption = ggplot2::element_text(
      hjust = 1,
      size = caption_size,
      margin = ggplot2::margin(t = caption_margin),
      family = caption_family,
      face = caption_face
    ),
    axis.text.x = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(t = 0)),
    axis.text.y = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(r = 0)),
    axis.title = ggplot2::element_text(size = axis_title_size, family = axis_title_family),
    axis.title.x = ggplot2::element_text(hjust = xj, size = axis_title_size,
                              family = axis_title_family, face = axis_title_face),
    axis.title.y = ggplot2::element_text(hjust = yj, size = axis_title_size,
                              family = axis_title_family, face = axis_title_face),
    axis.title.y.right = ggplot2::element_text(hjust = yj, size = axis_title_size, angle = 90,
                                    family = axis_title_family, face = axis_title_face),
    ...
  )

  # define color scale
  theme_color <- viridis::scale_fill_viridis(
    option = viridis_scale,
    direction = 1,
    na.value = "transparent",
    name = legend_title,
    guide = ggplot2::guide_colorbar(
      barheight = ggplot2::unit(40, units = "mm"),
      barwidth = ggplot2::unit(1, units = "mm"),
      draw.ulim = FALSE,
      title.hjust = 0.5,
      title.vjust = 1.5,
      label.hjust = 0.5
    )
  )

  # return as list
  list(theme_base,
       theme_color)

}

#' @rdname theme_nlm
#' @export
theme_nlm_discrete <- function(base_family = "Roboto Condensed",
                               base_size = 11.5,
                               plot_title_family = base_family,
                               plot_title_size = 18,
                               plot_title_face = "bold",
                               plot_title_margin = 10,
                               subtitle_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                               subtitle_size = 13,
                               subtitle_face = "plain",
                               subtitle_margin = 15,
                               strip_text_family = base_family,
                               strip_text_size = 12,
                               strip_text_face = "plain",
                               strip.background = "grey80",
                               caption_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                               caption_size = 9,
                               caption_face = "plain",
                               caption_margin = 10,
                               axis_text_size = base_size,
                               axis_title_family = base_family,
                               axis_title_size = 9,
                               axis_title_face = "plain",
                               axis_title_just = "rt",
                               plot_margin = ggplot2::margin(0, 0, 0, 0),
                               grid_col = "#cccccc",
                               grid = TRUE,
                               axis_col = "#cccccc",
                               axis = FALSE,
                               ticks = FALSE,
                               legend_title = "Z",
                               legend_labels = NULL,
                               legend_text_size  = 8,
                               legend_title_size = 10,
                               ratio = 1,
                               viridis_scale = "D",
                               ...) {
    # start with minimal theme
    ret <-
        ggplot2::theme_minimal(base_family = base_family, base_size = base_size)


    xj <- switch(tolower(substr(axis_title_just, 1, 1)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
    yj <- switch(tolower(substr(axis_title_just, 2, 2)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)


    # extend it
    theme_base <- ret + ggplot2::theme(
        legend.background = ggplot2::element_blank(),
        legend.text  = ggplot2::element_text(size = legend_text_size),
        legend.title = ggplot2::element_text(size = legend_title_size),
        aspect.ratio = ratio,
        plot.margin = plot_margin,
        strip.text = ggplot2::element_text(
            hjust = 0,
            size = strip_text_size,
            face = strip_text_face,
            family = strip_text_family
        ),
        strip.background = ggplot2::element_rect(fill = strip.background),
        panel.spacing = grid::unit(2, "lines"),
        plot.title = ggplot2::element_text(
            hjust = 0,
            size = plot_title_size,
            margin = ggplot2::margin(b = plot_title_margin),
            family = plot_title_family,
            face = plot_title_face
        ),
        plot.subtitle = ggplot2::element_text(
            hjust = 0,
            size = subtitle_size,
            margin = ggplot2::margin(b = subtitle_margin),
            family = subtitle_family,
            face = subtitle_face
        ),
        plot.caption = ggplot2::element_text(
            hjust = 1,
            size = caption_size,
            margin = ggplot2::margin(t = caption_margin),
            family = caption_family,
            face = caption_face
        ),
        axis.text.x = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(t = 0)),
        axis.text.y = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(r = 0)),
        axis.title = ggplot2::element_text(size = axis_title_size, family = axis_title_family),
        axis.title.x = ggplot2::element_text(hjust = xj, size = axis_title_size,
                                    family = axis_title_family, face = axis_title_face),
        axis.title.y = ggplot2::element_text(hjust = yj, size = axis_title_size,
                                    family = axis_title_family, face = axis_title_face),
        axis.title.y.right = ggplot2::element_text(hjust = yj, size = axis_title_size, angle = 90,
                                          family = axis_title_family, face = axis_title_face),
        ...
    )

  # define color scale
  theme_color <- viridis::scale_fill_viridis(
    option = viridis_scale,
    direction = 1,
    discrete = TRUE,
    na.value = "transparent",
    labels = if (is.null(legend_labels)) {
      ggplot2::waiver()
    } else {
      legend_labels
    },
    name = legend_title,
    guide = ggplot2::guide_legend(
      barheight = ggplot2::unit(40, units = "mm"),
      barwidth = ggplot2::unit(1, units = "mm"),
      draw.ulim = FALSE,
      title.hjust = 0.5,
      title.vjust = 1.5,
      label.hjust = 0.5
    )
  )

  # return as list
  list(theme_base,
       theme_color)

}

#' @rdname theme_nlm
#' @export
theme_nlm_grey <- function(base_family = "Roboto Condensed",
                           base_size = 11.5,
                           plot_title_family = base_family,
                           plot_title_size = 18,
                           plot_title_face = "bold",
                           plot_title_margin = 10,
                           subtitle_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                           subtitle_size = 13,
                           subtitle_face = "plain",
                           subtitle_margin = 15,
                           strip_text_family = base_family,
                           strip_text_size = 12,
                           strip_text_face = "plain",
                           strip.background = "grey80",
                           caption_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
                           caption_size = 9,
                           caption_face = "plain",
                           caption_margin = 10,
                           axis_text_size = base_size,
                           axis_title_family = base_family,
                           axis_title_size = 9,
                           axis_title_face = "plain",
                           axis_title_just = "rt",
                           plot_margin = ggplot2::margin(0, 0, 0, 0),
                           grid_col = "#cccccc",
                           grid = TRUE,
                           axis_col = "#cccccc",
                           axis = FALSE,
                           ticks = FALSE,
                           legend_title = "Z",
                           legend_labels = NULL,
                           legend_text_size  = 8,
                           legend_title_size = 10,
                           ratio = 1,
                           ...) {
    # start with minimal theme
    ret <-
        ggplot2::theme_minimal(base_family = base_family, base_size = base_size)


    xj <- switch(tolower(substr(axis_title_just, 1, 1)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
    yj <- switch(tolower(substr(axis_title_just, 2, 2)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)


    # extend it
    theme_base <- ret + ggplot2::theme(
        legend.background = ggplot2::element_blank(),
        legend.text  = ggplot2::element_text(size = legend_text_size),
        legend.title = ggplot2::element_text(size = legend_title_size),
        aspect.ratio = ratio,
        plot.margin = plot_margin,
        strip.text = ggplot2::element_text(
            hjust = 0,
            size = strip_text_size,
            face = strip_text_face,
            family = strip_text_family
        ),
        strip.background = ggplot2::element_rect(fill = strip.background),
        panel.spacing = grid::unit(2, "lines"),
        plot.title = ggplot2::element_text(
            hjust = 0,
            size = plot_title_size,
            margin = ggplot2::margin(b = plot_title_margin),
            family = plot_title_family,
            face = plot_title_face
        ),
        plot.subtitle = ggplot2::element_text(
            hjust = 0,
            size = subtitle_size,
            margin = ggplot2::margin(b = subtitle_margin),
            family = subtitle_family,
            face = subtitle_face
        ),
        plot.caption = ggplot2::element_text(
            hjust = 1,
            size = caption_size,
            margin = ggplot2::margin(t = caption_margin),
            family = caption_family,
            face = caption_face
        ),
        axis.text.x = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(t = 0)),
        axis.text.y = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(r = 0)),
        axis.title = ggplot2::element_text(size = axis_title_size, family = axis_title_family),
        axis.title.x = ggplot2::element_text(hjust = xj, size = axis_title_size,
                                    family = axis_title_family, face = axis_title_face),
        axis.title.y = ggplot2::element_text(hjust = yj, size = axis_title_size,
                                    family = axis_title_family, face = axis_title_face),
        axis.title.y.right = ggplot2::element_text(hjust = yj, size = axis_title_size, angle = 90,
                                          family = axis_title_family, face = axis_title_face),
        ...
    )

  # define color scale
  theme_color <- ggplot2::scale_fill_gradient(
    low = "#d0d0d0",
    high = "#000000",
    na.value = "transparent",
    name = legend_title,
    guide = ggplot2::guide_colorbar(
      barheight = ggplot2::unit(40, units = "mm"),
      barwidth = ggplot2::unit(1, units = "mm"),
      draw.ulim = FALSE,
      title.hjust = 0.5,
      title.vjust = 1.5,
      label.hjust = 0.5
    )
  )

  # return as list
  list(theme_base,
       theme_color)

}

#' @rdname theme_nlm
#' @export
theme_nlm_grey_discrete <-
  function(base_family = "Roboto Condensed",
           base_size = 11.5,
           plot_title_family = base_family,
           plot_title_size = 18,
           plot_title_face = "bold",
           plot_title_margin = 10,
           subtitle_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
           subtitle_size = 13,
           subtitle_face = "plain",
           subtitle_margin = 15,
           strip_text_family = base_family,
           strip_text_size = 12,
           strip_text_face = "plain",
           strip.background = "grey80",
           caption_family = if (.Platform$OS.type == "windows") "Roboto Condensed" else "Roboto Condensed Light",
           caption_size = 9,
           caption_face = "plain",
           caption_margin = 10,
           axis_text_size = base_size,
           axis_title_family = base_family,
           axis_title_size = 9,
           axis_title_face = "plain",
           axis_title_just = "rt",
           plot_margin = ggplot2::margin(0, 0, 0, 0),
           grid_col = "#cccccc",
           grid = TRUE,
           axis_col = "#cccccc",
           axis = FALSE,
           ticks = FALSE,
           legend_title = "Z",
           legend_labels = NULL,
           legend_text_size  = 8,
           legend_title_size = 10,
           ratio = 1,
           ...) {
      # start with minimal theme
      ret <-
          ggplot2::theme_minimal(base_family = base_family, base_size = base_size)


      xj <- switch(tolower(substr(axis_title_just, 1, 1)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
      yj <- switch(tolower(substr(axis_title_just, 2, 2)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)


      # extend it
      theme_base <- ret + ggplot2::theme(
          legend.background = ggplot2::element_blank(),
          legend.text  = ggplot2::element_text(size = legend_text_size),
          legend.title = ggplot2::element_text(size = legend_title_size),
          aspect.ratio = ratio,
          plot.margin = plot_margin,
          strip.text = ggplot2::element_text(
              hjust = 0,
              size = strip_text_size,
              face = strip_text_face,
              family = strip_text_family
          ),
          strip.background = ggplot2::element_rect(fill = strip.background),
          panel.spacing = grid::unit(2, "lines"),
          plot.title = ggplot2::element_text(
              hjust = 0,
              size = plot_title_size,
              margin = ggplot2::margin(b = plot_title_margin),
              family = plot_title_family,
              face = plot_title_face
          ),
          plot.subtitle = ggplot2::element_text(
              hjust = 0,
              size = subtitle_size,
              margin = ggplot2::margin(b = subtitle_margin),
              family = subtitle_family,
              face = subtitle_face
          ),
          plot.caption = ggplot2::element_text(
              hjust = 1,
              size = caption_size,
              margin = ggplot2::margin(t = caption_margin),
              family = caption_family,
              face = caption_face
          ),
          axis.text.x = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(t = 0)),
          axis.text.y = ggplot2::element_text(size = axis_text_size, margin = ggplot2::margin(r = 0)),
          axis.title = ggplot2::element_text(size = axis_title_size, family = axis_title_family),
          axis.title.x = ggplot2::element_text(hjust = xj, size = axis_title_size,
                                      family = axis_title_family, face = axis_title_face),
          axis.title.y = ggplot2::element_text(hjust = yj, size = axis_title_size,
                                      family = axis_title_family, face = axis_title_face),
          axis.title.y.right = ggplot2::element_text(hjust = yj, size = axis_title_size, angle = 90,
                                            family = axis_title_family, face = axis_title_face),
          ...
      )
    # define color scale
    theme_color <- ggplot2::scale_fill_brewer(
      palette = "Greys",
      na.value = "transparent",
      name = legend_title,
      labels = if (is.null(legend_labels)) {
        ggplot2::waiver()
      } else {
        legend_labels
      },
      guide = ggplot2::guide_legend(
        barheight = ggplot2::unit(40, units = "mm"),
        barwidth = ggplot2::unit(1, units = "mm"),
        draw.ulim = FALSE,
        title.hjust = 0.5,
        title.vjust = 1.5,
        label.hjust = 0.5
      )
    )

    # return as list
    list(theme_base,
         theme_color)

  }
