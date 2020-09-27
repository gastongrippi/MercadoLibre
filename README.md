# Mercado libre search app

[![N|Solid](https://http2.mlstatic.com/static/org-img/homesnw/mercado-libre.png?v=2)](https://www.mercadolibre.com.ar/)

Mercado libre search app allows you to look up for some products that you would like to buy. This app was developed using the API's available in https://developers.mercadolibre.com.ar/.

Once you install it you will be able to navigate through out 3 screens.

  - Search: Specify what you would like to look for
  - Product list: The results of your search (if there are any matches)
  - Detail: Product specific detail

## Third party libraries

### SDWebImage
This library provides an async image downloader with cache support and it's being used to load the images in the product list. I used this library since it's really easy to implement it, it's popular and reliable and it help us to deal with asynchronous image downloads, which is useful when we have to populate the table view cells.

Version used in this project: '~> 5.0'