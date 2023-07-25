package com.poly.entity;
import java.io.Serializable;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "Productdetail")
@Data
public class ProductsDetails implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Productdetail_id")
    private Integer Productdetailid;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private Products productID;

    @Column(name = "PD_quantity")
    private Integer pdQuantity;

    @Column(name = "color", nullable = false)
    private String color;

    @Column(name = "image", nullable = false)
    private String image;

    
}
