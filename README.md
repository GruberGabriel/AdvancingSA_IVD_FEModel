# Advancing Sensitivity Analysis of an Intervertebral Disc Finite Element Model: A Comparative Approach Using Neural Networks

This is the official code and data repository for the paper "Advancing Sensitivity Analysis of an Intervertebral Disc Finite Element Model: A Comparative Approach Using Neural Networks". 

**Abstract**

Introduction: Sensitivity analysis (SA) is essential for identifying influential input parameters in finite element (FE) models, such as those of the intervertebral disc (IVD). However, in complex IVD models, efficient methods often lack accuracy, while precise methods are computationally prohibitive. Surrogate models, like neural networks (NNs), provide a solution by enabling both efficient and accurate SA of such models.

Methods: This study leveraged an NN surrogate trained on an L4L5 IVD FE model to compare variance-based methods (Sobol analysis and Fourier Amplitude Sensitivity Test), the gradient-based Integrated Gradients (IG) approach, and linear model-based SA methods (CoD-ratio, CAR²-ratio, and Pearson’s correlation coefficients) for their applicability. A detailed SA of the model was conducted using Sobol analysis results to examine total-order and interaction effects of the model parameters. Performance evaluation of each method involved mean absolute deviation and Normalized Discounted Cumulative Gain (NDCG) scores, with Sobol analysis results as the reference.

Results: All methods effectively identified influential parameters, as indicated by high NDCG scores. Only variance-based methods, though, consistently quantified parameter influence and captured interactions. Neglecting interaction effects resulted in unexplained variances up to 25%, highlighting the need to consider total-order effects. Key model parameters were those related to fiber orientation and annulus fibrosus stiffness.

Conclusion: Variance-based global SA methods, enabled by the NN surrogate, were essential for fully understanding the FE model sensitivity, capturing total-order effects and parameter interactions. The IG method effectively identified key parameters, while the novel application of the NDCG scores demonstrated the strength of surrogate-assisted methods in assessing parameter influence.

[![DOI](https://zenodo.org/badge/DOI/DoNotUse.svg)](https://doi.org/10.3389/fbioe.2024.1391957)

## Content
The repository contains the data and code used for executing various sensitivity analysis (SA) methods on a finite element (FE) model of the human intervertebral disc (IVD).
It includes FE simulation results that enable global SA techniques, such as CoD-ratio, CAR²-ratio, Pearson's correlation coefficients, and RBF-FAST, as well as training and testing data for surrogate models used in SA methods like Sobol analysis, eFAST, and Integrated Gradients.
Each SA method is implemented and documented within the provided Jupyter Notebooks.

**SA methods overview:**

![SAmethodsOverview](https://github.com/user-attachments/assets/ee188753-3e5e-466b-a24f-5d41a6cd5274)

## Software Versions

This code has been developed and tested using the following software versions and packages:

- Python 3.11.5: PyTorch, Scikit-learn, SAlib
- R 4.4: care

## Installation and Setup
To set up the environment, please follow these steps:

Install Python 3.11.5 or a compatible version.<br />
Install conda.

To create the conda environment, execute the following commands:

````
conda env create -f environment.yml
conda activate sensitivity_analysis
````

## Citation

If you use this code for your research, please cite it as follows:

tbd

We kindly request that you cite our work in any publications that leverage this codebase. This will facilitate proper acknowledgment and enable others to locate the original work.


## Funding

The research for this article received funding from the European Research Council (ERC) under the European Union’s Horizon 2020 research and innovation program. Grant no.: 101045128-iBack-epic-ERC-2021-COG.
