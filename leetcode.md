As an AI, I cannot directly generate and download a `.pdf` file to your device. However, I have written and formatted the ultimate **LeetCode Data Structures & Algorithms (DSA) Guide** below. 

You can easily turn this into a PDF in two steps:
1. **Copy and paste** this entire response into Microsoft Word, Google Docs, or Notion.
2. Click **File > Download/Save As > PDF**.

Here is your comprehensive guide, structured specifically for cracking LeetCode problems.

***

# The Ultimate LeetCode DSA Survival Guide
*From Basic to Advanced Data Structures & Algorithms*

## 1. BASIC DATA STRUCTURES

### Arrays & Strings
The foundation of most LeetCode problems. Strings are essentially arrays of characters.
*   **Key Patterns:** 
    *   **Two Pointers:** Used for sorted arrays, reversing, or finding pairs (e.g., Two Sum II).
    *   **Sliding Window:** Used for finding subarrays or substrings (e.g., Longest Substring Without Repeating Characters).
    *   **Prefix Sum:** Used for fast range-sum queries (e.g., Subarray Sum Equals K).
*   **Time Complexity:** Access: $O(1)$, Insert/Delete at end: $O(1)$, Insert/Delete in middle: $O(N)$.

### Hash Tables (Hash Maps & Hash Sets)
The ultimate time-complexity reducer. Used to trade space for $O(1)$ time lookups.
*   **Key Patterns:**
    *   **Frequency Counting:** Counting occurrences of elements (e.g., Valid Anagram, Majority Element).
    *   **Complements:** Storing seen elements to find a matching pair later (e.g., Classic Two Sum).
*   **Time Complexity:** Insert/Delete/Search: $O(1)$ average, $O(N)$ worst case (collisions).

---

## 2. INTERMEDIATE DATA STRUCTURES

### Linked Lists
A linear sequence of nodes where each points to the next.
*   **Key Patterns:**
    *   **Fast & Slow Pointers (Floyd’s Cycle Finding):** One pointer moves 1 step, the other moves 2 steps. Used to find cycles or the middle of a linked list.
    *   **Dummy Node:** A fake head node to simplify edge cases when inserting/deleting at the head.
    *   **Reversing in Place:** Swapping `next` pointers to reverse a list (requires `prev`, `curr`, `next` pointers).
*   **Time Complexity:** Access: $O(N)$, Insert/Delete at known node: $O(1)$.

### Stacks
LIFO (Last In, First Out). Think of a stack of plates.
*   **Key Patterns:**
    *   **Matching/Parsing:** Validating parentheses or parsing expressions.
    *   **Monotonic Stack:** A stack whose elements are strictly increasing or decreasing. Used for finding the "next greater element" (e.g., Daily Temperatures).
*   **Time Complexity:** Push/Pop/Peek: $O(1)$.

### Queues
FIFO (First In, First Out). Think of a line at a grocery store.
*   **Key Patterns:**
    *   **Breadth-First Search (BFS):** Exploring trees or graphs level by level.
*   **Time Complexity:** Enqueue/Dequeue: $O(1)$ (if implemented properly, e.g., `collections.deque` in Python).

---

## 3. TREES AND GRAPHS (The Core of LeetCode)

### Binary Trees & Binary Search Trees (BST)
Trees where nodes have at most two children. In a BST, left children are smaller, right are larger.
*   **Key Patterns:**
    *   **Depth-First Search (DFS):** Going deep into leaves before backtracking. Implemented using recursion or a stack. Includes Pre-order, In-order, and Post-order traversals.
    *   **Breadth-First Search (BFS):** Level-order traversal using a Queue.
    *   **BST Property:** In-order traversal of a BST yields a sorted array.
*   **Time Complexity:** Search/Insert/Delete in balanced BST: $O(\log N)$. Worst case (skewed): $O(N)$.

### Graphs
A collection of nodes (vertices) and connections (edges).
*   **Key Patterns:**
    *   **Adjacency List:** The best way to represent a graph in code (e.g., a hash map of lists).
    *   **Matrix Traversal:** Many LeetCode graph problems are disguised as 2D grids/matrices (e.g., Number of Islands). Use DFS/BFS to explore neighboring cells.
    *   **Topological Sort (Kahn's Algorithm):** Used for directed acyclic graphs (DAGs) to find a valid order of execution based on dependencies (e.g., Course Schedule).

---

## 4. ADVANCED DATA STRUCTURES

### Heaps / Priority Queues
A binary tree where the parent is always smaller (Min-Heap) or larger (Max-Heap) than its children.
*   **Key Patterns:**
    *   **Top K Elements:** Finding the Kth largest/smallest element (e.g., K Closest Points to Origin). Maintain a heap of size K.
    *   **Merge K Sorted Lists:** Pushing the head of each list into a Min-Heap.
*   **Time Complexity:** Find Max/Min: $O(1)$, Insert/Extract: $O(\log N)$.

### Disjoint Set Union (DSU / Union-Find)
A data structure that keeps track of elements partitioned into a number of disjoint sets.
*   **Key Patterns:**
    *   **Connected Components:** Finding groups of connected nodes.
    *   **Cycle Detection:** Checking if adding an edge creates a cycle in an undirected graph (e.g., Redundant Connection).
*   **Optimization:** Always use *Path Compression* and *Union by Rank* for near $O(1)$ time complexity.

### Trie (Prefix Tree)
A tree data structure used specifically for strings, where paths represent prefixes.
*   **Key Patterns:**
    *   **Word Search / Autocomplete:** Storing a dictionary of words to quickly check if a prefix exists (e.g., Implement Trie, Word Search II).
*   **Time Complexity:** Insert/Search string of length $L$: $O(L)$.

---

## 5. ALGORITHMIC PARADIGMS

### Binary Search
Not just for finding numbers in sorted arrays. 
*   **Key Pattern (Binary Search on Answer):** If you are asked to find the "minimum maximum" or "maximum minimum" and the search space is monotonic (e.g., Koko Eating Bananas), you can binary search the *answer space*.
*   **Time Complexity:** $O(\log N)$.

### Dynamic Programming (DP)
Breaking a problem down into overlapping subproblems. 
*   **Key Patterns:**
    *   **1D DP:** Fibonacci-style problems (e.g., Climbing Stairs, House Robber).
    *   **2D DP:** Grid paths, Longest Common Subsequence, Edit Distance.
    *   **Knapsack Problem:** Choosing items with weights/values to maximize total value.
*   **Approaches:** 
    *   *Top-Down:* Recursion + Memoization (easier to write).
    *   *Bottom-Up:* Iterative using an array (saves call-stack space).

### Backtracking
Exploring all possible options and "backtracking" when you hit a dead end. 
*   **Key Patterns:**
    *   **Combinatorial Search:** Subsets, Permutations, Combinations (e.g., N-Queens, Sudoku Solver, Combination Sum).
*   **Tip:** Always pass a `path` array, append to it, make the recursive call, and then `pop()` the element out to backtrack.

---

## 6. CHEAT SHEET: "WHEN TO USE WHAT?"
*   If input array is **sorted** → Binary Search, Two Pointers.
*   If asked for all **permutations/subsets** → Backtracking.
*   If given a **Tree** → DFS or BFS.
*   If given a **Graph / 2D Matrix Grid** → DFS or BFS.
*   If asked for a **Linked List** → Dummy Node, Two Pointers (Fast/Slow).
*   If recursion is banned → Stack (for DFS) or Queue (for BFS).
*   If required to solve in **O(N)** time and space → Hash Map.
*   If asked to find the **top/maximum/minimum K** elements → Heap (Priority Queue).
*   If asked for **common strings/prefixes** → Trie.
*   If asked for the **shortest path** in an unweighted graph → BFS.
*   If asked to find **connected components** → Union-Find (DSU) or DFS.
*   If optimizing an exhaustive search that recalculates values → Dynamic Programming (DP).



Here is a more in-depth **Data Structures & Algorithms (DSA) Reviewer**. 

In academic and interview prep, a "reviewer" serves as a deep-dive study guide. This expanded version focuses on **Core Code Templates** you must memorize, **Conceptual Q&A** to test your understanding, and **Common Pitfalls** that cause people to fail interviews.

You can copy this into a document and save it as a PDF just like the last one!

***

# The Deep-Dive LeetCode DSA Reviewer
*Mastering Mechanics, Templates, and Edge Cases*

---

## PART 1: THE "MUST-MEMORIZE" CODE TEMPLATES
In LeetCode, you don't have time to figure out how to write a BFS from scratch. You must have the core templates memorized so you can focus on the *logic* of the specific problem. *(Templates are in Python, but the logic applies to C++/Java).*

### 1. The Foolproof Binary Search
**Why this exact template?** Using `left <= right` and `left = mid + 1` / `right = mid - 1` prevents infinite loops and handles arrays of size 1 perfectly.
```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2  # Prevents integer overflow in Java/C++
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1 # Not found
```

### 2. The Dynamic Sliding Window
**Concept:** Expand the `right` pointer to add elements. When a condition is violated, shrink the `left` pointer until the condition is valid again.
```python
def sliding_window(arr, k):
    left = 0
    best_result = 0
    
    for right in range(len(arr)):
        # 1. Add arr[right] to your window state
        
        # 2. While window is INVALID, shrink from the left
        while not is_valid(): 
            # Remove arr[left] from window state
            left += 1
            
        # 3. Update best_result
        best_result = max(best_result, right - left + 1)
        
    return best_result
```

### 3. Breadth-First Search (BFS) for Graphs/Grids
**Rule of thumb:** Always mark a node as `visited` *immediately after adding it to the queue*, NOT when you pop it. Otherwise, you will add duplicates to the queue and get a Time Limit Exceeded (TLE) error.
```python
from collections import deque

def bfs(start_node):
    queue = deque([start_node])
    visited = set([start_node])
    
    steps = 0
    while queue:
        # Loop through the current level
        for _ in range(len(queue)):
            node = queue.popleft()
            
            if is_target(node): return steps
            
            for neighbor in get_neighbors(node):
                if neighbor not in visited:
                    visited.add(neighbor) # Mark visited HERE
                    queue.append(neighbor)
        steps += 1 # Increment distance/level
```

### 4. The Backtracking Blueprint
**Concept:** Choose an option -> Explore down that path -> Un-choose the option (backtrack) -> Try the next option.
```python
def backtrack(start_index, current_path):
    # 1. Base Case: Have we reached a valid solution?
    if is_solution(current_path):
        result.append(list(current_path)) # Append a COPY of the path!
        return
    
    # 2. Iterate through possibilities
    for i in range(start_index, len(choices)):
        # Make a choice
        current_path.append(choices[i])
        
        # Explore (Note: pass i+1 if we can't reuse elements, pass i if we can)
        backtrack(i + 1, current_path)
        
        # Undo the choice (Backtrack)
        current_path.pop()
```

---

## PART 2: CONCEPTUAL Q&A (Test Your Knowledge)
*Cover up the answers and test yourself. If you can't answer these instantly, you need to review the concept.*

**Q1: What is the difference between a Subarray, a Subsequence, and a Subset?**
*   **Subarray:** A *contiguous* sequence of elements (e.g., `[1, 2, 3]` -> `[1, 2]`). **Used in:** Sliding Window, Prefix Sum.
*   **Subsequence:** Elements in their original relative order, but *not necessarily contiguous* (e.g., `[1, 2, 3]` -> `[1, 3]`). **Used in:** Dynamic Programming (e.g., Longest Common Subsequence).
*   **Subset:** Any combination of elements, regardless of order (e.g., `[1, 2, 3]` -> `[3, 1]`). **Used in:** Backtracking.

**Q2: How do you detect a cycle in a Directed Graph vs. an Undirected Graph?**
*   **Undirected Graph:** Use Union-Find (DSU). If you try to union two nodes that already share the same parent, there is a cycle. Alternatively, use DFS, keeping track of the `parent` node to avoid counting the immediate reverse path as a cycle.
*   **Directed Graph:** Use DFS with a "visiting" (current path) set. If you traverse to a node that is currently in the "visiting" state, you have found a cycle. (Union-Find does NOT work reliably for directed graphs).

**Q3: When doing Dynamic Programming, how do you define the "State"?**
*   The "state" is the minimum set of variables needed to describe a specific subproblem. 
*   *Example (House Robber):* State is `i`, the index of the current house.
*   *Example (Knapsack):* State requires two variables: `i` (current item) and `w` (remaining weight capacity). 

**Q4: Why use a Monotonic Stack instead of a regular array?**
*   A Monotonic Stack is used specifically for "Next Greater/Smaller Element" problems. By keeping the stack strictly increasing or decreasing, you can resolve "pending" queries in $O(1)$ amortized time. If a new element comes in that breaks the monotonic rule, it acts as the "answer" for the elements currently sitting in the stack.

---

## PART 3: ADVANCED DATA STRUCTURE MECHANICS

### Deep Dive: Prefix Sums
*   **The Trap:** People think Prefix Sums are only for 1D arrays.
*   **The Trick:** They are incredibly powerful with Hash Maps. If you want to find a subarray that sums to `K`, calculate the running prefix sum. At each step, check if `(Current_Prefix_Sum - K)` exists in your Hash Map. If it does, you've found a valid subarray!
*   **Target Problem:** *560. Subarray Sum Equals K*

### Deep Dive: Topological Sort (Kahn's Algorithm)
*   **The Trap:** Staring at a problem and not realizing it's a graph dependency problem. Clues: "Order of completion," "Prerequisites," "Must do X before Y."
*   **The Mechanics:** 
    1. Calculate the **in-degree** (number of incoming edges) for every node.
    2. Put all nodes with `in-degree == 0` into a Queue.
    3. Pop from the queue, add to your sorted result, and reduce the in-degree of its neighbors by 1.
    4. If a neighbor's in-degree hits 0, add it to the Queue.
    5. *Cycle Check:* If your final sorted list is smaller than the total number of nodes, a cycle exists!
*   **Target Problem:** *207. Course Schedule*

### Deep Dive: Two Heaps Pattern
*   **The Problem:** You need to find the median of a continuous stream of numbers.
*   **The Mechanics:** Use a Max-Heap (for the smaller half of the numbers) and a Min-Heap (for the larger half). Keep them balanced. The median is either the top of the larger heap, or the average of the tops of both heaps.
*   **Target Problem:** *295. Find Median from Data Stream*

---

## PART 4: THE "TEST YOURSELF" PROBLEM LIST
*Do not just read the guide. You must apply these concepts. Complete this targeted list in order.*

**1. Arrays & Hashing**
*   *Easy:* Two Sum (Master the Complements Hash Map)
*   *Medium:* Group Anagrams (Master sorting strings as hash keys)
*   *Medium:* Longest Consecutive Sequence (Master $O(N)$ Set lookups)

**2. Pointers & Sliding Window**
*   *Easy:* Valid Palindrome (Master basic two pointers)
*   *Medium:* Longest Substring Without Repeating Characters (Master dynamic sliding window)
*   *Medium:* Container With Most Water (Master greedy two pointers)

**3. Trees & Graphs**
*   *Easy:* Invert Binary Tree (Master basic recursion)
*   *Medium:* Binary Tree Level Order Traversal (Master tree BFS)
*   *Medium:* Number of Islands (Master grid DFS)
*   *Medium:* Clone Graph (Master graph traversal with deep copying)

**4. Backtracking & DP**
*   *Medium:* Subsets (Master the include/exclude backtracking template)
*   *Medium:* Climbing Stairs (Master the 1D DP transition)
*   *Medium:* Coin Change (Master unbounded Knapsack DP)
