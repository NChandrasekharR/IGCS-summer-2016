# IGCS Summer 2016 - Land Use Agent-Based Model

## Overview

This repository contains an Agent-Based Model (ABM) simulating land use dynamics in **Sriperumbudur**, Tamil Nadu, focusing on the socioeconomic impacts of industrialization around the **SIPCOT (State Industries Promotion Corporation of Tamil Nadu)** industrial area. This research was conducted during Summer 2016 at IGCS.

## About the Project

The model examines how industrial development affects local populations, particularly the interactions between:
- **Industrial workers** employed in SIPCOT
- **Farmers** cultivating land in surrounding areas
- **Land economics** including property values, income, and expenditure patterns
- **Migration dynamics** as economic pressures drive population movements
- **Socioeconomic stress** including the critical issue of farmer distress

### Authors
- Achyut
- Chandra
- Jegadish

## Model Description

### What Does the Model Simulate?

This NetLogo-based ABM recreates the economic and spatial dynamics around an industrial zone, modeling:

1. **Geographic Layout**
   - Central SIPCOT industrial area (brown patches)
   - Surrounding non-industrial/agricultural areas (blue patches with varying shades)
   - Land values that decrease with distance from SIPCOT
   - Fertility values for agricultural land

2. **Agent Types**
   - **Workers** (yellow): Individuals employed in SIPCOT who earn regular wages
   - **Farmers** (black): Agricultural workers whose income depends on land fertility

3. **Economic Dynamics**
   - Land value inflation over time
   - Income generation (workers: fixed wage; farmers: fertility-dependent)
   - Expenditure patterns (higher costs near crowded industrial areas)
   - Savings accumulation or depletion

4. **Behavioral Rules**
   - **Workers** move closer to SIPCOT if they can afford it (uphill on land value gradient)
   - **Workers** move away from SIPCOT if they cannot afford the area (downhill on land value gradient)
   - **Farmers** sell land and relocate when land values exceed their savings
   - **Farmers** may transform into workers when economically pressured (50% probability after 5 years)
   - Agents face economic distress when savings fall below critical thresholds

## Key Research Findings

Through systematic exploration of the model's parameter space, three distinct behavioral regimes emerged based on the relative rates of land price inflation and income growth:

### 1. Equilibrium Regime
**Condition**: Land inflation ≈ Income inflation

When land price growth roughly equals income growth, the system reaches a stable state with minimal agent movement. Both farmers and workers maintain their positions, as affordability remains relatively constant over time.

### 2. Displacement Regime
**Condition**: Land inflation > Income inflation

When land prices rise faster than incomes, agents are forced to sell their land at a premium and relocate away from SIPCOT. This creates:
- **Outward migration** patterns as land becomes unaffordable
- **Farmer displacement** from high-value areas near industry
- **Occupation switching** as farmers transition to become workers ("farkers")

### 3. Clustering Regime
**Condition**: Land inflation < Income inflation

When incomes grow faster than land prices, workers accumulate savings and can afford to move closer to SIPCOT, where their income potential is highest. This produces:
- **Worker concentration** near the industrial zone
- **Spatial sorting** by occupation and economic capacity

### Emergent Poverty Trap

A critical emergent property of the model is **irreversibility of displacement**. Farmers who sell land near SIPCOT and move to peripheral areas become locked out from returning because:
- Their distance from SIPCOT reduces potential income as workers
- High land prices near SIPCOT remain unaffordable
- This creates **path dependency** where initial conditions determine long-term outcomes

This finding highlights how industrialization can create permanent economic stratification even without explicit barriers to mobility.

### Field Validation

The model's predictions were corroborated by **anecdotal evidence from field surveys** in the Sriperumbudur area, including observations of:
- Farmers selling land and relocating to peripheral areas
- Occupation transitions from agriculture to industrial work
- Difficulty for displaced populations to return to areas near SIPCOT

## How to Use the Model

### Requirements

- **NetLogo 5.3.1** or higher
- Download from: [https://ccl.northwestern.edu/netlogo/](https://ccl.northwestern.edu/netlogo/)

### Running the Simulation

1. **Open the model**
   ```
   Open NetLogo → File → Open → Select "land-1.nlogo"
   ```

2. **Setup the simulation**
   - Adjust the sliders to set initial parameters (see Parameters section below)
   - Click the **Setup** button to initialize the world

3. **Run the simulation**
   - Click the **Go** button to start the simulation
   - Each tick represents one time period (approximately one year)
   - Watch how agents move and populations change over time

### Interface Controls

#### Sliders

| Parameter | Range | Default | Description |
|-----------|-------|---------|-------------|
| `no-workers` | 0-100 | 49 | Initial number of industrial workers |
| `no-farmers` | 0-100 | 100 | Initial number of farmers |
| `inflation-rate-land` | 0.90-1.07 | 1.01 | Annual land value inflation rate |
| `inf-rate-income` | 0.90-1.07 | 1.005 | Annual income growth rate |
| `inf-rate-expenditure` | 0.90-1.07 | 1.02 | Annual expenditure inflation rate |

#### Display Options

**display-label** chooser allows you to visualize:
- `Money-Saved`: Shows each agent's current savings
- `Land-Value`: Displays land value for each patch
- `Fertility`: Shows fertility values (green scale)
- `No-Label`: Clean view without labels

#### Monitors

- **Farmer**: Current count of farmers
- **Worker**: Current count of workers
- **Suicides**: Count of agents who have exited due to extreme economic distress

#### Plot

Real-time graph showing:
- Worker population (black line)
- Farmer population (green line)

## Key Observations

### What to Notice While Running

1. **Migration Patterns**
   - Workers gradually cluster closer to SIPCOT as they save money
   - Farmers retreat from high-value areas near industry
   - Formation of distinct economic zones

2. **Population Dynamics**
   - Worker population tends to stabilize or grow
   - Farmer population typically declines over time
   - Rate of transformation from farmer to worker

3. **Economic Stratification**
   - Wealth concentration patterns
   - Areas of high vs. low economic stress
   - Impact of crowding on worker expenditure

4. **Critical Thresholds**
   - Relationship between inflation rates and sustainability
   - Tipping points for farmer distress
   - Impact of land value inflation on displacement

### Experimental Questions to Explore

1. **What happens if land inflation greatly exceeds income growth?**
   - Try: `inflation-rate-land = 1.05`, `inf-rate-income = 1.00`

2. **Can the farmer population be sustained?**
   - Try: Lower land inflation, higher income rates

3. **How does initial population ratio affect outcomes?**
   - Try: Equal numbers of workers and farmers
   - Try: Predominantly farmers vs. predominantly workers

4. **What if expenditure is controlled?**
   - Try: `inf-rate-expenditure = 0.95` (negative inflation/deflation)

## Model Insights

This simulation helps understand:

- **Industrialization impacts** on rural populations
- **Economic displacement** mechanisms
- **Land speculation** effects on vulnerable populations
- **Policy implications** for balanced regional development
- **Social costs** of rapid industrial growth

The model particularly highlights the vulnerability of agricultural communities to land market pressures created by industrial development.

## Additional Documentation

For detailed presentations and research findings, please refer to:

- **Research Writeup**: `IGCS report_3rd draft_Oct 24.docx`
  - Formal research paper with abstract, methodology, findings, and future directions
  - Discusses the three behavioral regimes and emergent poverty trap phenomenon

- **PowerPoint Presentation**: `ABM presentation Jun 8 final.pptx`
  - Visual explanations, methodology, and key findings

- **Final Presentation**: `July 15 ABM (Achyut, Chandra, Jegadish).pdf`
  - Comprehensive documentation of the research, analysis, and conclusions

These files provide deeper insights into the model design, validation, and implications for urban planning and policy.

## Technical Details

### Model File
- **Filename**: `land-1.nlogo`
- **Platform**: NetLogo 5.3.1
- **Language**: NetLogo modeling language

### Key Functions

- `Setup`: Initializes the world, creates agents, sets initial values
- `Go`: Main simulation loop (call repeatedly to run)
- `create-workers`: Spawns worker agents
- `create-farmers`: Spawns farmer agents
- `worker-shift-up`: Handles worker migration toward SIPCOT
- `worker-shift-down`: Handles worker migration away from SIPCOT
- `farmer-shift`: Handles farmer relocation behavior
- `farmer-transform`: Converts farmers to workers under economic pressure
- `farmer-die`: Removes agents who reach extreme economic distress thresholds

## Context: SIPCOT and Sriperumbudur

**Sriperumbudur** is an industrial town in Tamil Nadu, India, located near Chennai. The **SIPCOT industrial complex** has attracted major manufacturing facilities, creating significant economic opportunities but also placing pressure on surrounding agricultural communities through:

- Rising land values
- Displacement of traditional livelihoods
- Environmental changes
- Socioeconomic stratification

This model helps quantify and visualize these dynamics.

## Research Applications

This ABM can support:

- **Urban planning** decisions regarding industrial zone placement
- **Policy analysis** for protecting agricultural communities
- **Economic studies** of industrialization impacts
- **Educational purposes** in agent-based modeling and complex systems
- **Scenario testing** for development interventions

## Limitations and Future Extensions

### Current Limitations
- Simplified economic model (actual markets are more complex)
- Binary agent types (real populations are more diverse)
- No government intervention mechanisms modeled
- Simplified spatial representation

### Possible Extensions
- Add more agent types (merchants, service workers, etc.)
- Model environmental factors (water, pollution)
- Include policy interventions (subsidies, land reforms)
- Add social networks and family structures
- Incorporate actual geographic data
- Model transportation infrastructure

## Citation

If you use this model in your research or education, please cite:

```
Agent-Based Model of Land Use in Sriperumbudur
Achyut, Chandra, & Jegadish
IGCS Summer 2016
GitHub: https://github.com/NChandrasekharR/IGCS-summer-2016
```

## License

This is an academic research project. Please contact the authors for usage permissions.

## Contact

For questions or collaborations regarding this model, please refer to the repository owner's contact information.

---

**Note**: This model addresses sensitive real-world issues including economic displacement, livelihood loss, and farmer distress in peri-urban areas. It is intended as a scientific tool for understanding these socioeconomic challenges and informing policy interventions to support vulnerable communities during industrial transitions.
