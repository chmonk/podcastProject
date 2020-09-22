package podcast.model.dao;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import podcast.model.javabean.OrderItemBean;
public class ShoppingCart {   
	
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	
	public ShoppingCart() {
	}
	                                                     //getXXX= XXX屬性
	public Map<Integer, OrderItemBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int activityId, OrderItemBean  oib) {
		if (oib.getQuantity() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(activityId) == null ) {
		    cart.put(activityId, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean oiBean = cart.get(activityId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			oiBean.setQuantity(oib.getQuantity() + oiBean.getQuantity());
		}
	}

	public boolean modifyQty(int activityId, int newQty) {
		if ( cart.get(activityId) != null ) {
		   OrderItemBean  bean = cart.get(activityId);
		   bean.setQuantity(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int delete(int activityId) {
		if ( cart.get(activityId) != null ) {
	       cart.remove(activityId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public double getSubtotal(){
		double subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			OrderItemBean oib = cart.get(n);
			double price    = oib.getUnitPrice();
			//double discount = oib.getDiscount();
			int qty      = oib.getQuantity();
			//subTotal +=  price * discount * qty;
			subTotal +=price *qty;
		}
		return subTotal;
	}
}
