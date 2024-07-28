package iuh.vn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iuh.vn.entities.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>{

}
