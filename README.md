# 🩺 超声手术刀换能器系统设计与优化

> **作者**：Zhen Zhu @ 清华大学深圳国际研究生院 LIMES 实验室  
> **关键词**：超声手术刀、夹心式压电换能器、变幅杆优化、有限元分析、MATLAB、Abaqus  
> **仓库内容**：Abaqus 仿真数据、MATLAB 数据处理程序、DWG 等效电路图、高分辨率设计与仿真图片

---

## 📖 项目简介

本项目完整记录了**夹心式压电超声换能器系统**及其配套**变幅杆、带斜槽刀杆**的设计、理论分析、有限元仿真与优化过程。研究基于**等效电路法**建立换能器系统的机电模型，结合 Abaqus 有限元分析进行结构与性能优化，并通过 MATLAB 对数据进行处理与结果分析，最终实现满足医疗应用需求的超声手术刀设计。

---

## 🎯 研究背景

传统超声手术工具主要通过空化作用碎裂软组织或利用磨削作用去除骨组织，无法实现高效的直接切割。本研究通过在换能器系统中引入**纵-扭复合振动**，在组织表面形成轴向力与切向力的叠加，从而实现对骨与软骨的直接切割。

核心创新点：
- **夹心式压电换能器**产生纵向振动
- **变幅杆**进行振幅放大
- **刀杆斜槽结构**将部分纵振转换为扭振
- 系统参数优化确保谐振频率、振幅与应力均满足医疗安全标准

---

## ⚙️ 系统设计与方法

- **理论分析**：Mason 等效电路模型、一维变截面细杆纵振分析
- **材料选择**：PZT-8 压电陶瓷、TC4 钛合金、45# 钢
- **有限元仿真**：Abaqus 模态分析与谐响应分析
- **优化目标**：
  - 谐振频率约 25 kHz
  - 刀头轴向振幅 ≥ 100 μm
  - 降低应力集中
- **MATLAB 数据处理**：放大系数计算、频率方程求解、结构优化

---

## 📂 仓库结构

```

├── MATLAB/ # 数据处理脚本  
│ ├── horn_gain_calc.m  
│ ├── frequency_analysis.m  
│ └── ...  
├── Abaqus_Data/ # 有限元仿真导出数据（odb, csv）  
├── CAD/ # DWG 等效电路与结构设计图  
│ ├── transducer_equiv_circuit.dwg  
│ └── horn_design.dwg  
├── Media/ # 高分辨率图片（设计图、电路图、网格图、模态分析等）  
├── README.md # 项目说明文件  
└── LICENSE

```


---

## 🖼 主要成果展示

### 1. 等效电路与结构设计

<div align="center">
  <img src="Media/equiv_circuit.jpg" width="48%">
  <img src="Media/transducer_structure.jpg" width="48%">
</div>
<p align="center">▲ 换能器系统等效电路与三维结构示意图</p>

---

### 2. 有限元网格与模态分析

<div align="center">
  <img src="Media/mesh_view.jpg" width="48%">
  <img src="Media/modal_mode.jpg" width="48%">
</div>
<p align="center">▲ Abaqus 网格划分与纵振模态结果</p>

---

### 3. 变幅杆优化

<div align="center">
  <img src="Media/horn_shape_opt.jpg" width="48%">
  <img src="Media/horn_gain_result.jpg" width="48%">
</div>
<p align="center">▲ 圆锥-圆柱复合变幅杆形状及放大系数优化</p>

---

### 4. 带斜槽刀杆设计

<div align="center">
  <img src="Media/slotted_rod.jpg" width="48%">
  <img src="Media/rod_modal.jpg" width="48%">
</div>
<p align="center">▲ 带斜槽刀杆结构与纵-扭复合振动模态</p>

---

### 5. 整体装配与性能

<div align="center">
  <img src="Media/final_assembly.jpg" width="48%">
  <img src="Media/vibration_result.jpg" width="48%">
</div>
<p align="center">▲ 超声手术刀整体装配模型与振幅分布结果</p>

---

## 📊 关键性能指标

| 部件       | 放大系数 | 谐振频率 (kHz) | 轴向振幅 (μm) |
|------------|----------|----------------|---------------|
| 前盖板     | 1.635    | 25.206          | —             |
| 变幅杆     | 3.289    | 25.069          | —             |
| 刀杆       | 3.903    | 24.933          | —             |
| 整体系统   | 17.000   | 24.996          | ≥ 100         |

---

## 📜 引用与许可

若在您的研究中使用本项目成果，请引用：

> 朱臻，《夹心式压电换能器系统的理论分析、设计及优化——基于超声手术刀的研究》，清华大学，2025。

许可证：MIT

---
