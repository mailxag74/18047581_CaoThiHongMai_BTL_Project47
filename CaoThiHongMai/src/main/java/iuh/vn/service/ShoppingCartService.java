package iuh.vn.service;

import java.util.Collection;

import org.springframework.stereotype.Service;

import iuh.vn.entities.CartItem;
import iuh.vn.entities.Product;

@Service
public interface ShoppingCartService {

	int getCount();

	double getAmount();

	void clear();

	Collection<CartItem> getCartItems();

	void remove(CartItem item);

	void add(CartItem item);

	void remove(Product product);

}
