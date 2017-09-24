import ShopifyBuy from 'shopify-buy'
import * as setup from '../index'
import * as actions from '../redux/actions'

export const InitializeShopify = () => {

  var client = ShopifyBuy.buildClient({
    domain: 'shopheep.myshopify.com',
    accessToken: 'a444eb17144b5b4e7841eaa1e4cf8698',
    appId: '6',
  });

  client.fetchAllProducts()
    .then(
      (products) => {AddProductsToRedux(products)}
    );   
}

const AddProductsToRedux = (products) => {
  
  setup.store.dispatch(actions.populateShopify(products));
}
