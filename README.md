# 🧠 Psychographic Segmentation & Behavioral Tipping Points

[![Publication](https://img.shields.io/badge/Publication-Journal_of_Media_Psychology-blue)](https://econtent.hogrefe.com/doi/pdf/10.1027/1864-1105/a000367)
[![Method](https://img.shields.io/badge/Method-Experimental_Design-green)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)
[![Tools](https://img.shields.io/badge/Tools-SPSS_%7C_R_(ggplot2)-orange)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)

### **Project Overview**

**A psychographic segmentation study determining exactly when users disengage from content.**

This project utilizes **SPSS** (Regression/ANOVA) to model behavioral thresholds and **R** to visualize the divergence points where user values override content engagement. By analyzing user responses to narrative characters across a continuum of behaviors, I isolated the exact threshold where "Universal Consensus" (everyone agrees the behavior is okay) fractures into "Psychographic Divergence" (reactions depend on user personality).

This research provides a framework for **Trust & Safety** and **Personalization Algorithms**, demonstrating that "offensive" content is not a static label, but a dynamic interaction between content severity and user traits.

> **📄 Publication:**
> Francemone, C. J., & Matthews, N. L. (2022). Moral tipping points: How trait moral salience moderates judgments of narrative characters along the moral continuum. *Journal of Media Psychology.*
>
> 👉 [**Read the Full Paper (PDF)**](Francemone_Tipping_Points_JMP_2022.pdf)

---

### **Key Strategic Insights**

#### **1. The "Tipping Point" Threshold**
We often assume users judge content linearly. This study proves otherwise.
* **The Findings:** For mild transgressions, user demographics and psychographics do not matter—audience sentiment is uniform (Consensus).
* **The Shift:** Once content crosses a specific severity threshold (The Tipping Point), audience sentiment fractures.
* **Business Impact:** Content moderation algorithms cannot treat all users the same. High-severity content requires **psychographic filtering** rather than broad demographic targeting.

#### **2. Psychographics Predict Churn/Disengagement**
Standard demographics (Age, Gender) failed to predict user backlash.
* **The Driver:** **"Trait Moral Salience"** (a user's sensitivity to specific values like Harm or Fairness) was the single strongest predictor of negative reaction *after* the tipping point.
* **Strategic Application:** Platforms can reduce churn by scoring users on "Sensitivity Metrics" and filtering borderline content accordingly, rather than banning the content globally.

#### **3. The "Moral Continuum" Framework**
I developed a reusable experimental procedure (The Moral Continuum Procedure) to test user tolerance.
* **Method:** Users evaluated characters across a randomized sequence of escalating behaviors.
* **Result:** Visualized the exact slope of audience approval, allowing us to pinpoint where engagement drops off for different user segments.

---

### **Methodology**

* **Design:** Between-Subjects Experimental Design (2 Studies).
* **Participants:** N ≈ 400 (Recruited via standardized panels).
* **Analysis:**
    * **Hierarchical Regression:** To test the incremental predictive validity of psychographics over demographics.
    * **Interaction Modeling (PROCESS Macro):** To visualize the "fanning effect" where user segments diverge as content intensity increases.
* **Tools:**
    * **SPSS:** Used for primary data cleaning, hierarchical regression, and PROCESS macro interaction modeling.
    * **R (ggplot2):** Used to generate high-resolution interaction plots to visualize the "fan effect" of user divergence.

---

### **Repository Structure**

```text
/Psychographic-Segmentation-and-Behavioral-Tipping-Points
│
├── /data
│   ├── Study1_Cleaned.csv         <-- Anonymized participant response data
│   └── Study2_Cleaned.csv         <-- Replication study data
│
├── /analysis
│   ├── Syntax_Regression.sps      <-- SPSS syntax for the regression models
│   └── Interaction_Plots.R        <-- Code for visualizing the "Tipping Point"
│
├── /results
│   ├── Interaction_Graph.png      <-- Visualization of the divergence point
│   └── Summary_Tables.pdf         <-- Regression coefficients and significance
│
└── Francemone_Moral_Tipping_Points.pdf  <-- Full published manuscript
