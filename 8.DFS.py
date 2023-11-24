class Graph:
    def __init__(self):
        self.graph = {}

    def add_edge(self, node, neighbor):
        if node not in self.graph:
            self.graph[node] = []
        self.graph[node].append(neighbor)

def dfs(graph, start, visited):
    if start not in visited:
        print(start, end=" ")
        visited.add(start)
        for neighbor in graph.get(start, []):
            dfs(graph, neighbor, visited)

def main():
    g = Graph()

    # Example graph
    g.add_edge('A', 'B')
    g.add_edge('A', 'C')
    g.add_edge('B', 'D')
    g.add_edge('B', 'E')
    g.add_edge('C', 'F')
    g.add_edge('C', 'G')

    start_node = 'A'
    visited_nodes = set()

    print("Depth-First Search:")
    dfs(g.graph, start_node, visited_nodes)

if __name__ == "__main__":
    main()
