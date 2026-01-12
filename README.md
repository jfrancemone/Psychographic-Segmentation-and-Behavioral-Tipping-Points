# 🧠 Psychographic Segmentation & Behavioral Tipping Points

[![Publication](https://img.shields.io/badge/Publication-Journal_of_Media_Psychology_(2022)-blue)](https://econtent.hogrefe.com/doi/pdf/10.1027/1864-1105/a000367)
[![Method](https://img.shields.io/badge/Method-Experimental_Design_(N%3D400)-green)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)
[![Tools](https://img.shields.io/badge/Tools-SPSS_%7C_R-orange)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)

### **Project Overview**

**At what point does a user condemn media content?**

This project identifies the specific **tipping point** where user values override content engagement. By analyzing user responses to agents across a continuum of behaviors, I isolated the exact threshold where "Universal Consensus" (everyone agrees the behavior is okay) fractures into "Psychographic Divergence" (reactions depend on user personality).

This research provides a framework for **Trust & Safety** and **Personalization Algorithms**, demonstrating that "offensive" content is not a static label, but a dynamic interaction between content severity and user traits.

> **📄 Publication:**
> Francemone, C. J., & Matthews, N. L. (2022). Moral tipping points: How trait moral salience moderates judgments of narrative characters along the moral continuum. *Journal of Media Psychology, 35*(4), 221-227.
> 
> [**[Read the Full Paper (PDF)]**](Francemone_Moral_Tipping_Points.pdf)

---

### **Key Findings & Strategic Insights**

#### **1. The "Tipping Point" Threshold**
We often assume users judge content linearly. This study proves otherwise.
* **The Finding:** For mild transgressions, user demographics and psychographics do not matter and audience sentiment is largely uniform (Consensus).
* **The Shift:** Once content crosses a specific severity threshold (The Tipping Point), audience sentiment fractures.
* **Business Impact:** Content moderation algorithms cannot treat all users the same. High-severity content requires **psychographic filtering** rather than broad demographic targeting.

#### **2. Psychographics Predict Churn**
* **The Driver:** **"Trait Moral Salience"** (a user's sensitivity to specific moral values) was the single strongest predictor of negative reaction *after* the tipping point.
* **Strategic Application:** Platforms can reduce churn by scoring users on sensitivity metrics and filtering borderline content accordingly, rather than banning content globally.

#### **3. The "Moral Continuum" Framework**
I implemented a reusable experimental procedure (The Moral Continuum Procedure) to test user tolerance.
* **Method:** Users evaluated characters across a randomized sequence of escalating behaviors.
* **Result:** Visualized the exact slope of audience approval in order to pinpoint where engagement drops off for different user segments.

---

### **Repository Structure**

The project utilizes **SPSS** for statistical modeling (Hierarchical Regression/ANOVA) and **R** for interaction visualization.

```text
/Psychographic-Segmentation-and-Behavioral-Tipping-Points
│
├── /data
│   ├── Study1_Cleaned.csv         <-- Anonymized participant response data
│   └── Study2_Cleaned.csv         <-- Replication study data
│
├── /analysis
│   ├── Syntax_Regression.sps      <-- SPSS syntax for regression models
│   └── Interaction_Plots.R        <-- R code for visualizing "Tipping Points"
│
├── /results
│   ├── Interaction_Graph.png      <-- Visualization of the divergence point
│   └── Summary_Tables.pdf         <-- Regression coefficients and significance
│
└── Francemone_Moral_Tipping_Points.pdf  <-- Full published manuscript
