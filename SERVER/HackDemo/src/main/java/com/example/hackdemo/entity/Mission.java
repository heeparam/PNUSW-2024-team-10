package com.example.hackdemo.entity;

import com.example.hackdemo.enumeration.MissionStatus;
import com.example.hackdemo.enumeration.MissionType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "mission")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Mission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String message;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private MissionStatus status;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private MissionType type;

    @Column(name = "totalDuration")
    private Integer totalDuration;


    @OneToMany(mappedBy = "mission", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("orderIndex ASC")
    private List<MissionItem> missionItems;

    public String getFormattedTotalDuration() {
        int hours = totalDuration / 60;
        int minutes = totalDuration % 60;
        return (hours > 0 ? hours + "시간 " : "") + (minutes > 0 ? minutes + "분" : "");
    }
}
