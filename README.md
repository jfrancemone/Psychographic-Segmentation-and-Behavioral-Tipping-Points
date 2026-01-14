# 🧠 Psychographic Segmentation & Behavioral Tipping Points

[![Publication](https://img.shields.io/badge/Publication-Journal_of_Media_Psychology_(2022)-blue)](https://econtent.hogrefe.com/doi/pdf/10.1027/1864-1105/a000367)
[![Method](https://img.shields.io/badge/Method-Experiment_(N%3D900)-green)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)
[![Tools](https://img.shields.io/badge/Tools-SPSS_%7C_R-orange)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)

### **Project Overview**

This project identifies the specific **tipping point** where user values override content engagement. By analyzing user responses to agents across a continuum of behaviors, I isolated the exact threshold where universal consensus (everyone agrees the behavior is okay) fractures into psychographic divergence (reactions depend on user personality).

This research provides a framework for **Trust & Safety** and **Personalization Algorithms**, demonstrating that offensive content is not a static label, but a dynamic interaction between content severity and user traits.

> **📄 Publication:**
> Francemone, C. J., & Matthews, N. L. (2022). Moral tipping points: How trait moral salience moderates judgments of narrative characters along the moral continuum. *Journal of Media Psychology, 35*(4), 221-227.
> 
> [**Read the Full Paper (PDF)**](Francemone_Tipping_Points_2022.pdf)

---

### **Key Findings & Strategic Insights**

#### **1. The Tipping Point Threshold**
We often assume users judge content linearly. This study proves otherwise.
* **The Finding:** For mild transgressions, user demographics and psychographics do not matter and audience sentiment is largely uniform (Consensus).
* **The Shift:** Once content crosses a specific severity threshold (The Tipping Point), audience sentiment fractures.
* **Business Impact:** Content moderation algorithms cannot treat all users the same. High-severity content requires **psychographic filtering** rather than broad demographic targeting.

#### **2. Psychographics Predict Churn**
* **The Driver:** **Trait Moral Salience** (a user's sensitivity to harmful transgressions) was the single strongest predictor of negative reaction *after* the tipping point.
* **Strategic Application:** Platforms can reduce churn by scoring users on sensitivity metrics and filtering borderline content accordingly, rather than banning content globally.

#### **3. The Moral Continuum Framework**
I implemented a reusable experimental procedure (The Moral Continuum Procedure) to test user tolerance.
* **Method:** Users evaluated characters across a randomized sequence of escalating behaviors.
* **Result:** Visualized the exact slope of audience approval in order to pinpoint where engagement drops off for different user segments.

![Multilevel Modeling Visualization](visualization_and_robustness_checks/Multilevel_Models.png)

---

### **Methodology**

* **Design:** Between-Subjects Experimental Design (2 Studies).
* **Participants:** N ≈ 900 (Recruited via standardized panels).
* **Analysis:**
    * **Multilevel Modeling:** To test the incremental predictive validity of psychographics over demographics and visualize the fanning effect where user segments diverge as content intensity increases.
* **Tools:**
    * **SPSS:** Used for primary data cleaning, descriptive statistics, and multilevel modeling.
    * **R:** Used to generate interaction plots to visualize the fan effect of user divergence.

---

### **Repository Structure**

The project utilizes **SPSS** for statistical modeling and **R** for visualization.

```text
/Psychographic-Segmentation-and-Behavioral-Tipping-Points
│
├── /data
│   ├── Study_1_Data.csv                               <-- Primary dataset (converted from SAV)
│   ├── Study_2_Data.csv                               <-- Replication dataset (converted from SAV)
│   ├── Study_1_Data.sav                               <-- Original .sav files (SPSS)
│   └── Study_2_Data.sav
│
├── /analysis
│   ├── Study_1_Syntax.sps                             <-- Syntax for Study 1
│   └── Study_2_Syntax.sps                             <-- Syntax for Study 2
│
├── /visualization_and_robustness_checks
│   ├── Cumulative_Linked_Mixed_Models_Comparison.Rmd  <-- R Markdown using comparison models for robustness check
│   ├── Multilevel_Models_Visualization.Rmd            <-- R Markdown generating multilevel model visualization
│   └── Multilevel_Models.png                          <-- Visualization of genre clusters
│
├── /results
│   ├── Study_1_Results.csv                            <-- Visualization of the divergence point
│   └── Study_2_Results.csv                            <-- Regression coefficients and significance
│
└── Francemone_Tipping_Points_2022.pdf                 <-- Full published manuscript
```

---

### **My Role**
**Lead Researcher**
* Conceptualized the tipping point framework to evaluate user engagement thresholds.
* Implemented the reusable Moral Continuum testing procedure.
* Conducted all statistical analysis (SPSS), including multilevel modeling.
* Created the data visualizations (R) to demonstrate user segmentation divergence.
