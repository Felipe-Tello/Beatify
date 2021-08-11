package com.team.beatify.repositories;

import java.util.List;

import com.team.beatify.models.Beat;
import com.team.beatify.models.Category;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BeatRepository extends BaseRepository<Beat> {
    List<Beat> findAllByOrderByIdDesc();
// @Query(value = "SELECT * FROM publications p JOIN addresses a ON a.id=p.address JOIN comunas c ON a.comuna = c.id JOIN regiones r ON c.region = r.id WHERE r.name_region LIKE %?1%", nativeQuery = true)
    List<Beat> findByCategoriesContaining(Category category);
    @Query(value = "SELECT * FROM beats b JOIN users u ON u.id=b.u_creador_id WHERE b.title LIKE %?1% OR u.first_name LIKE %?1% OR u.region LIKE %?1% OR u.location LIKE %?1%", nativeQuery = true)
    List<Beat> findByTitleOrUCreatorContaining(String busqueda);
}
