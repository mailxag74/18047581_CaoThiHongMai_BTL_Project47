package iuh.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iuh.vn.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
