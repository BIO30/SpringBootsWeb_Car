package com.poly.entity;
import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Products")
@Data
public class Products implements Serializable {
    @Id
    @Column(name = "product_id", length = 30)
    private String productId;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "category_id")
    private Categories categoryID;

    @Column(name = "product_name", nullable = false, length = 100)
    private String productName;

    @Column(name = "price", nullable = false)
    private Long price;

    @Column(name = "image", nullable = false, columnDefinition = "nvarchar(max)")
    private String image;

    @Column(name = "description", columnDefinition = "nvarchar(max)")
    private String description;

    @OneToMany (mappedBy = "productID")
    private List<ProductsDetails> ProductsDetails;

    // Constructors, getters, setters
}

