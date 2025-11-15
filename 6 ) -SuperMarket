/**
 * @description Handles supermarket operations such as billing,
 *              reordering, product storage and stock display.
 * @author           Vasantharaj K
 * @date             2025-11-15
 */

 public class Product {

    public String code { get; set; }
    public String name { get; set; }
    public Decimal price { get; set; }
    public Integer stock { get; set; }
    public Decimal discountPercent { get; set; }

    public Product(String code, String name, Decimal price, Integer stock, Decimal discountPercent) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.discountPercent = discountPercent;
    }

    /**
     * @description Computes the final price after applying discount.
     */
    public Decimal getDiscountedPrice() {
        return price - (price * (discountPercent / 100));
    }
}


public class SuperMarket {

    // Stores products using product code as the key.
    private Map<String, Product> productMap = new Map<String, Product>();

    /**
     * @description Loads sample products on initialization.
     */
    public SuperMarket() {
        addProduct(new Product('P001', 'Rice Bag', 1200, 10, 5));
        addProduct(new Product('P002', 'Oil Can', 1800, 5, 10));
        addProduct(new Product('P003', 'Wheat Flour', 550, 20, 0));
    }

    /**
     * @description Adds a product to the supermarket list.
     */
    private void addProduct(Product p) {
        productMap.put(p.code, p);
    }

    /**
     * @description Generates the total bill for a given product and quantity.
     *              Also reduces stock after billing.
     */
    public Decimal generateBill(String productCode, Integer quantity) {

        if (!productMap.containsKey(productCode)) {
            throw new AuraHandledException('Invalid product code: ' + productCode);
        }

        Product p = productMap.get(productCode);

        if (p.stock < quantity) {
            throw new AuraHandledException('Insufficient stock for product: ' + productCode);
        }

        Decimal total = p.getDiscountedPrice() * quantity;

        // Update stock after successful billing
        p.stock -= quantity;

        return total;
    }

    /**
     * @description Reorders stock when it falls below a threshold.
     */
    public void reorder(String productCode, Integer threshold, Integer reorderQuantity) {

        if (!productMap.containsKey(productCode)) {
            throw new AuraHandledException('Invalid product code: ' + productCode);
        }

        Product p = productMap.get(productCode);

        if (p.stock <= threshold) {
            p.stock += reorderQuantity;
        }
    }

    /**
     * @description Returns a formatted list of current stock items.
     */
    public List<String> displayStock() {
        List<String> stockList = new List<String>();

        for (Product p : productMap.values()) {
            stockList.add(
                'Code: ' + p.code +
                ' | Name: ' + p.name +
                ' | Stock: ' + p.stock +
                ' | Price: ' + p.price +
                ' | Discount: ' + p.discountPercent + '%'
            );
        }
        return stockList;
    }
}
//Anonymous
SuperMarket sm = new SuperMarket();

// Billing Example
Decimal amount = sm.generateBill('P001', 2);
System.debug('Final Bill: ' + amount);

// Reorder Example
sm.reorder('P002', 3, 10);

// Stock Display
System.debug(sm.displayStock());
