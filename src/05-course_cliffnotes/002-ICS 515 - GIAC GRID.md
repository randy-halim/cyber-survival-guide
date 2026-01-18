# ICS 515 - ICS Visibility, Detection, and Response
ICS 515 is divided into **five different sections** (books). In order, they are:
1. ICS Cyber Threat Intelligence
2. Visibility & Asset Identification
3. ICS Threat Detection
4. Incident Response
5. Threat & Environment Manipulation
# 1. ICS Cyber Threat Intelligence
**Heterogeneous OT** was what ICS started out as: bespoke components for one-off problems/solutions. The industry eventually moved to **Homogeneous OT** where common network protocols, development environments, and logic controllers were created. Because of homogeneous OT, we are slowly moving from random shot-in-the-dark attacks to more sophisticated and repeatable attacks.

Defenders have an advantage, not adversaries, but only when that advantage is actually used!
## Sliding Scale of Cyber Security
Five categories, in order of "fundamental to possibly unneeded":
- Architecture
- Passive Defense
- Active Defense
- Intelligence
- Offense
**Focus on the fundamentals first (architecture);** they are less costly and serve as the base for the rest of the scale, while providing the best "return on investment". Offense is costly and has low ROI.
## Active Cyber Defense Cycle (ACDC)
A framework for **active defense in OT**. The most critical part, compared to traditional IT defense, is **keeping systems safely running** while collecting quality forensic evidence for later.
## Intelligence
**Intelligence is defined as** both a product and a process; **analysts** create intelligence, not tools, based on their expertise in the subject matter.

**Cyber Threat Intelligence** relates possible **threats** with **cyber indicators**. They often include **indicators of compromise (IOCs)** which can be host-based or network-based.

We follow the **Intelligence Life Cycle** which is a formal and tested process. Remember that as you go from operational environment, to data, to information, to intelligence; you get less and less as you go down (in other words: from your entire environment you likely end up with a small amount of intelligence).

**Threats** are defined and realized only if all three aspects are present:
- Capability: does the adversary have the means to exploit?
- Intent: do they have a motivating reason to exploit?
- Opportunity: does the organization have the vulnerability that the capability can exploit?
If one of these is missing, it cannot be a threat.

You can organize threats as **Activity Groups** and is often modeled with the **Diamond Model**. Cannot possibly identify every threat actor, just do the best you can given your environment.

Every organization has an **Information Attack Space**, and is important to know what yours looks like. OSINT is important; notable areas of concern include job postings (reveal specific OT used in a niche field), PR documents as a result of new partnerships, and others.
## ICS Cyber Kill Chain
The traditional Cyber Kill Chain is a seven-step process that adversaries need to execute to accomplish their mission; just because there is an intrusion doesn't mean they won; they need to effect their goals (e.g. exfil information)

The **ICS Cyber Kill Chain** builds on this idea for OT specifics:
- **Stage 1** is an adversaries initial access into an IT network, which then pivots into the OT network.
	- Main goals: discover what they're working with, exfiltrate data, and research the OT.
	- **Easier to stop adversaries here** because they still don't know what they're doing yet.
- **Stage 2** is when adversaries deploy tailored ICS capabilities to cause effects and accomplish their mission.
	- Either using the same access chain as Stage 1, or a new attack chain to hide tracks
	- **If they get to their Impact, game over**; at this point, focus on incident response at this point.
# 2. Visibility & Asset Identification
In OT, **asset identification** is the act of inventorying your ICS/OT assets in your environment. Traditional IT-asset identification (e.g. `nmap`) doesn't work as they could damage OT networks; instead use **precise methodology** to keep systems safe. 
## Wireshark for Asset Identification
These specific features/tools can be found in the `Statistics` tab in Wireshark:
- **Wireshark Endpoints** identify logical endpoints at each protocol level.
- **Wireshark Conversations** identify logical communications between endpoints.
- **Protocol Hierarchy** quickly identifies dissected protocols in a capture.
## Typical Networking Protocols in a ICS/OT Context

| Protocol                             | ICS Context                                                 |
| ------------------------------------ | ----------------------------------------------------------- |
| ARP (Address Resolution Protocol)    | - Very common in OT<br>- Ties MAC addresses to IP addresses |
| NetBIOS                              |                                                             |
| SMB (Server Message Block)           |                                                             |
| DNS & mDNS                           |                                                             |
| Link-Local Multicast Name Resolution |                                                             |
| DHCP                                 |                                                             |
| LLDP                                 |                                                             |
| Cisco Discovery Protocol             |                                                             |
| SNMP                                 |                                                             |
| Telnet                               |                                                             |
| FTP                                  |                                                             |
## ICS/OT Specific Protocols

| Protocol  | Description |
| --------- | ----------- |
| ModbusTCP |             |
