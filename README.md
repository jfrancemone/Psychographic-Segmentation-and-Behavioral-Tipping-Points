# 🧠 Psychographic Segmentation & Behavioral Tipping Points

[![Publication](https://img.shields.io/badge/Publication-Journal_of_Media_Psychology_(2022)-blue)](https://econtent.hogrefe.com/doi/pdf/10.1027/1864-1105/a000367)
[![Method](https://img.shields.io/badge/Method-Experiment_(N%3D889)-green)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)
[![Tools](https://img.shields.io/badge/Tools-SPSS_%7C_R-orange)](https://github.com/jfrancemone/Psychographic-Segmentation-and-Behavioral-Tipping-Points)

### **Project Overview**

When do individual differences start to matter? This experimental research identifies the specific **tipping point** where user values override consensus judgment. By analyzing user responses across a continuum of behaviors, I isolated the threshold where uniform agreement fractures into psychographic divergence — where reactions become dependent on individual moral sensitivity.

The findings have implications for content moderation and personalization: offensive content is not a static label, but a dynamic interaction between content severity and user traits. This research offers a psychological framework for understanding when "one-size-fits-all" content policies may fail.

> **📄 Publication:**
> Francemone, C. J., & Matthews, N. L. (2022). Moral tipping points: How trait moral salience moderates judgments of narrative characters along the moral continuum. *Journal of Media Psychology, 35*(4), 221-227.
> 
> [**Read the Full Paper (PDF)**](Francemone_Tipping_Points_2022.pdf)

*Note: This project uses SPSS for statistical modeling and R for visualization. The analytical approach is tool-agnostic and transferable to Python-based workflows (e.g., statsmodels, matplotlib).*

---

### **Key Findings & Strategic Insights**

#### **1. The Tipping Point Threshold**
We often assume users judge content linearly. This study demonstrates otherwise.
* **The Finding:** For mild transgressions, user demographics and psychographics do not matter as audience sentiment is largely uniform (Consensus).
* **The Shift:** Once content crosses a specific severity threshold (The Tipping Point), audience sentiment fractures based on individual differences.
* **Implication:** Content policies that work for mild content may not generalize to more severe content, where individual variation becomes the dominant factor.

#### **2. Psychographics Predict Divergence**
* **The Finding:** **Trait Moral Salience** (a user's sensitivity to moral transgressions) was the strongest predictor of negative reaction *after* the tipping point was crossed.
* **Implication:** Individual moral sensitivity scores could help identify which users are most likely to react negatively to borderline content — relevant for personalization and content filtering strategies.

#### **3. The Moral Continuum Framework**
Applied the Moral Continuum Procedure (Matthews, 2019) to systematically test user tolerance across escalating content severity.
* **Method:** Users evaluated characters across a randomized sequence of escalating behaviors.
* **Result:** Visualized the exact slope of audience approval, pinpointing where engagement drops off for different user segments.

<img src="visualization_and_robustness_checks/Multilevel_Models.png" alt="Multilevel Modeling Visualization" width="90%">

---

### **Methodology**

* **Design:** Between-Subjects Experimental Design (2 Studies).
* **Participants:** N = 889 across 2 studies (Study 1 = 528, Study 2 = 361).
* **Analysis:**
    * **Multilevel Modeling:** To test whether psychographic variables (trait moral salience) predict judgment beyond demographics, and to visualize the "fanning effect" where user segments diverge as content severity increases.
* **Tools:**
    * **SPSS:** Primary data management, descriptive statistics, and multilevel modeling.
    * **R:** Interaction plots to visualize user segmentation divergence.

---

### **Repository Structure**

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
│   └── Multilevel_Models.png                          <-- Visualization of divergence effect
│
├── /results
│   ├── Study_1_Results.csv                            <-- Visualization of the divergence point
│   └── Study_2_Results.csv                            <-- Regression coefficients and significance
│
└── Francemone_Tipping_Points_2022.pdf                 <-- Full published manuscript
```

---

### **My Role**
**Lead Researcher (First Author)**
* Conceptualized the tipping point framework to identify when individual differences override consensus.
* Applied the Moral Continuum Procedure (Matthews, 2019) to systematically test tolerance thresholds.
* Conducted all statistical analyses (SPSS), including multilevel modeling.
* Created all data visualizations (R) demonstrating user segmentation divergence.
* First author on the peer-reviewed publication in *Journal of Media Psychology.*
