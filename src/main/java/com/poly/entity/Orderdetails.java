package com.poly.entity;
import java.io.Serializable;
import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "Orderdetails")
@Data
public class Orderdetails implements Serializable {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_details_id")
    private Integer orderDetailsId;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private Orders orderID;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private Products productID;

    @Column(name = "color")
    private String color;
    
    @Column(name = "quantity")
    private Integer quantity;

 

    // Constructors, getters, setters
}

